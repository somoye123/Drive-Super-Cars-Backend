module Api::V1
  class CarsController < SecuredController
    def index
      @houses = House.all
      render json: @houses
    end

    def create
      house = House.create!(house_params)
      render json: house, status: :created
    end

    private

    def house_params
      params.permit(:photo, :description, :category, :image)
    end
  end
end
