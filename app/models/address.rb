class Address < ApplicationRecord
  belongs_to :purchase, optional: true
end
