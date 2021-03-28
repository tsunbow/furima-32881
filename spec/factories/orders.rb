FactoryBot.define do
  factory :order do
    postal_code          { '123-4567' }
    area_id              { 2 }
    municipality         { '横浜市緑区' }
    house_number         { '青山1-1-1'}
    phone_number         { '09012345678' }
    building_name        { 'マンション' }
  
    
  end
end
