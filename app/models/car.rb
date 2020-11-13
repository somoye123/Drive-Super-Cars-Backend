class Car < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  has_one_attached :image

  def img_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
  end
end
