module Api::V1
  class CarsController < SecuredController

    def index
      render json: Car.all
    end

    def create
      car = Car.create!(car_params)
      render json: car, status: :created
    end

    def show
      @car = Car.find(params[:id])
      return render json: @car, status: :ok if @car
    end

    private

    def car_params
      params.permit(:description, :name, :image)
    end
  end
end
