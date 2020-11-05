class UsersController < SecuredController
  def create
    @user = User.find_by(email: params[:email])
    return render json: @user, status: :ok if @user

    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
