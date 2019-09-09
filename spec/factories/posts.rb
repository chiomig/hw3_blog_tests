FactoryBot.define do
  factory :post do
    association :user
    title { FFaker::Book.title }
    article { FFaker::Lorem.paragraph }
  end
end
