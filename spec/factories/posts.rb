FactoryBot.define do
  factory :post do
    association :user
    title { FFaker::Book.title }
    article { FFaker::Lorem.paragraph }

    factory :invalid_post do
      association :user
      title { nil }
      article { nil }
    end

    factory :static_post do
      association :user
      title { "my awesome post" }
      article { "my awesome post article text" }
    end
  end
end
