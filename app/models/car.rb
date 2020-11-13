class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one_attached :image
  def img_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
  end
end
