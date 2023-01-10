class Tag < ApplicationRecord
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :contribution_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :contributions, through: :contribution_tag_relations, dependent: :destroy

  #タグが存在しているかを確認するバリデーション
  validates :name, presence: true
end
