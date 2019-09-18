FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email  { FFaker::Internet.email }

    factory :invalid_user do
      username { nil }
      email { nil }
    end
  end
end
