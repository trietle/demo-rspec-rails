# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title) {|n| "Post #{n}" }
    description Faker::Lorem.sentences

    factory :published_post do
      published true
    end
  end
end
