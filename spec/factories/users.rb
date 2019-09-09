FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email  { FFaker::Internet.email }

    after(:build) do |user|
      [:post, :post].each do |post|
        user.posts << FactoryBot.build(:post, user: user)
      end
    end
  end
end
