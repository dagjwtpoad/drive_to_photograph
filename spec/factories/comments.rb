FactoryBot.define do
  factory :comment do
    content        { 'あああああ' }
    association :user
    association :photograph
  end
end
