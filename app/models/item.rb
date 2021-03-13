class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
  end
  with_options presence: true do
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :cost_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :datee_id, numericality: { other_than: 1 } 
  end

  validates :price, presence: true, numericality: { only_integer: true,
  greater_than: 299, less_than: 10000000
 }
  
  belongs_to :user
  # has_one :purchases
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :datee
  

end
