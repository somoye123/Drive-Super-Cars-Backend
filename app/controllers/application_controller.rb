class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid

  private

  def not_found(errors)
    render json: errors, status: :not_found
  end

  def invalid(errors)
    render json: errors, status: :unprocessable_entity
  end
end
