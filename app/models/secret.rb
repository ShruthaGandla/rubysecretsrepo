class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes ,dependent: :destroy
  has_many :userswho_liked,  through: :likes, source: :user
end
