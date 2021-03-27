class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :house_number, :phone_number, :building_name

  with_options presence: true do
    validates :postal_code, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :area_id
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :house_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, numericality: { only_integer: true }
  end

  def save


  end
  
  # belongs_to :user
  # belongs_to :item
  # has_one :address
end
