class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(errors)
    render json: errors, status: 404
  end
end
