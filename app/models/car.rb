class Car < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  has_one_attached :image

  validates :name, :description, :image, presence: true

end
