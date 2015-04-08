FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) { Faker::Name.name }
    f.sequence(:email) { Faker::Internet.email }
  
  # if this is called directly, it will automatically first run the function it's nested in (:user).
    factory :user_with_tweets do |f|
      after(:create) do |u|
        FactoryGirl.create_list :tweet, Random.rand(10..100), :user => u
      end
    end
  end

  factory :tweet do |f|
    f.sequence(:post) { Faker::Lorem.sentence }
  end
end
