module Api::V1
  class UsersController < SecuredController
    before_action :set_user, only: %i[create]

    def create
      return render json: @user, status: :ok if @user

      user = User.create!(user_params)
      render json: user, status: :created
    end

    def new_appointment
      @user = User.find_by(id: appointment_params[:user_id])
      @car = Car.find_by(id: appointment_params[:car_id])
      appointment = Appointment.create!(appointment_params)
      render json: appointment, status: :created
    end

    private

    def set_user
      @user = User.find_by(email: params[:email])
    end

    def user_params
      params.permit(:username, :email)
    end

    def appointment_params
      params.permit(:car_id, :user_id)
    end
  end
end
