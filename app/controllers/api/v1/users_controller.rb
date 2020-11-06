module Api::V1
  class UsersController < SecuredController
    skip_before_action :authorize_request, only: [:index]
    def index
      render json: User.all, status: :created
    end
    def create
      @user = User.find_by(email: params[:email])
      return render json: @user, status: :ok if @user

      user = User.create!(user_params)
      render json: user, status: :created
    end

    private

    def user_params
      params.permit(:username, :email)
    end
  end
end
