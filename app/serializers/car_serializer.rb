class CarSerializer < ActiveModel::Serializer
  def initialize(car: nil)
    super
    @car = car
  end

  def serialize_new_car()
    serialized_new_car = serialize_car(@car)
    serialized_new_car.to_json
  end

  private

  def serialize_car(car)
    {
      id: car.id,
      img_url: car.img_url,
      name: car.name,
      description: car.description
    }
  end
end
