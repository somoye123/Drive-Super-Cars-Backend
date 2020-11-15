module Api::V1
  class CarsController < SecuredController
    def index
      render json: Car.all
    end

    def create
      @car = Car.create!(car_params)
      respond_to_car()
    end

    def show
      @car = Car.find(params[:id])
      return render json: @car, status: :ok if @car
    end

    private

    def car_params
      params.permit(:description, :name, :image)
    end

    def respond_to_car()
      if @car.valid?()
        car_serializer = CarSerializer.new(car: @car)
        render json: car_serializer.serialize_new_car(), status: :created
      end
    end
  end
end
