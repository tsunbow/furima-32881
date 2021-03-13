FactoryBot.define do
  factory :item do
    item_name          { Faker::Name.initials }
    text               { Faker::Lorem.sentence }
    category_id        { '2' }
    condition_id       { '2' }
    cost_id            { '2' }
    area_id            { '2' }
    datee_id           { '2' }
    price              { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
