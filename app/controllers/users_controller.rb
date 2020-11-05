class UsersController < SecuredController
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
