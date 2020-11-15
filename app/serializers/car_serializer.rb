class CarSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :image

  def image
    return unless object.image.attached?

    {
      url: rails_blob_url(object.image),
      signed_id: object.image.signed_id
    }
  end
end
