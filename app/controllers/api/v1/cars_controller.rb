module Api::V1
  class CarsController < SecuredController
    def index
      @car = Car.all
      respond_to_car
    end

    def create
      @car = Car.create!(car_params)
      respond_to_car
    end

    def show
      @car = Car.find(params[:id])
      respond_to_car
    end

    private

    def car_params
      params.permit(:description, :name, :image)
    end

    def respond_to_car()
      return unless @car

      car_serializer = CarSerializer.new(car: @car)
      render json: car_serializer.serialize_new_car
    end
  end
end
