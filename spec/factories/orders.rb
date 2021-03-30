FactoryBot.define do
  factory :order do
    token                {"tok_abcdefghijk00000000000000000"}
    postal_code          { '123-4567' }
    area_id              { 2 }
    municipality         { '横浜市緑区' }
    house_number         { '青山1-1-1'}
    phone_number         { '09012345678' }
    building_name        { 'マンション' }
  
    
  end
end
