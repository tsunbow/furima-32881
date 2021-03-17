class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :datee_id
  end

  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than: 299, less_than: 10_000_000 }

  belongs_to :user
  has_one :purchases
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :datee
end
