class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contributions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_contributions, through: :favorites, source: :contribution

end
