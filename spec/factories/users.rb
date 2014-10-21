FactoryGirl.define do
  factory :user do
    name "test user"
    sequence(:email) { |n| "test#{n}@gmail.com" }
    provider "developer"
    nickname "test_user1"
    sequence(:access_toke) { |n| "1112233#{n}aaaabbcc" }
    sequence(:secret_token) { |n| "aabbcceedd#{n}1112233" }
  end
end
