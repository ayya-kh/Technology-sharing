class Contribution < ApplicationRecord
  has_one_attached :video
  validates :title, length: { in: 1..100 }

  #contributionテーブルから中間テーブルに対する関連付け
  has_many :contribution_tag_relations, dependent: :destroy
  #contributionテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :contribution_tag_relations, dependent: :destroy

  belongs_to :user
  has_many :favorites, dependent: :destroy

  def self.search_by_word(word)
    Contribution.where(['title LIKE ? OR text LIKE ?', "%#{word}%", "%#{word}%"])
  end

  #タイトルが存在しているかを確認するバリデーション
  validates :title, presence: true
  #内容が存在しているかを確認するバリデーション
  validates :text, presence: true
  #動画が存在しているかを確認するバリデーション
  validates :video, presence: true

  #ユーザidがFavoritesテーブル内に存在するかどうか
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
