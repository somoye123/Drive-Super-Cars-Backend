class CarSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :image

  def image
    rails_blob_url(object.image) if object.image.attached?
  end
end
