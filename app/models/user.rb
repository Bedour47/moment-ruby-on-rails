class User < ApplicationRecord
  has_many :posts
  has_many :likes, dependent: :destroy

  validates :email, :username, :name, :password, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  validates :name, :username, length: {
    minimum: 3,
    #customize the error message. The %{count}, rails provide it to us from the minimum
    too_short: "must have at least %{count} letters"
}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
