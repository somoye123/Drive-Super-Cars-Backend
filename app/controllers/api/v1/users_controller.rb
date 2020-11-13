module Api::V1
  class UsersController < SecuredController
  before_action :set_user, only: %i[create new_appointment]

    def create
      return render json: @user, status: :ok if @user

      user = User.create!(user_params)
      render json: user, status: :created
    end

    private

    def set_user
      @user = User.find_by(email: params[:email])
    end

    def user_params
      params.permit(:username, :email)
    end
  end
end
