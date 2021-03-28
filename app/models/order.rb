class Order

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :house_number, :phone_number, :building_name

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, numericality: { only_integer: true }
  end


  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, phone_number: phone_number, building_name: building_name, user_id: user_id)
  end

end
