FactoryBot.define do
  factory :photograph do
    title              { Faker::Name.initials }
    description        { Faker::Lorem.sentence }
    category_id        { '3' }
    prefecture_id      { '14' }
    address            { '東京ドーム' }
    association :user

    after(:build) do |photograph|
      photograph.image.attach(io: File.open('public/images/309331.jpg'), filename: '309331.jpg')
    end
  end
end
