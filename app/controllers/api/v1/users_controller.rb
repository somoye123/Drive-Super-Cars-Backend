module Api::V1
  class UsersController < SecuredController
    def create
      @user = User.find_by(email: params[:email])
      return render json: @user, status: :ok if @user

      user = User.create!(user_params)
      render json: user, status: :created
    end

    def all_appointment
      @user = User.find(params[:id])
      return render json: @user.cars, status: :ok if @user
    end

    def new_appointment
      @user = User.find_by(id: appointment_params[:user_id])
      @car = Car.find_by(id: appointment_params[:car_id])
      appointment = Appointment.create!(appointment_params)
      render json: appointment, status: :created
    end

    private

    def user_params
      params.permit(:username, :email)
    end

    def appointment_params
      params.permit(:car_id, :user_id)
    end
  end
end
