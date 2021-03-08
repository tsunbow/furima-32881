class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchases
  has_one_attached :image
  
end
