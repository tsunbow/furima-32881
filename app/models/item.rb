class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :date_id
  end
  validates :price, presence: true, numericality: { only_integer: true,
  greater_than: 300, less_than: 9999999
 }
  
  belongs_to :user
  # has_one :purchases
  has_one_attached :image

end
