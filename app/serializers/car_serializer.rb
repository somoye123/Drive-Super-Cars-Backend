class CarSerializer < ActiveModel::Serializer
  def initialize(car: nil)
    super
    @car = car
  end

  def serialize_new_car
    serialized_new_car = serialize_car(@car)
    serialized_new_car.to_json
  end

  private

  def serialize_car(car)
    if car.is_a?
      return car.map do |car_object|
               { id: car_object.id, img_url: car_object.img_url,
                 name: car_object.name, description: car_object.description }
             end
    end

    {
      id: car.id,
      img_url: car.img_url,
      name: car.name,
      description: car.description
    }
  end
end
