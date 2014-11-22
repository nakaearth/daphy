FactoryGirl.define do
  factory :user do
    name 'test_user'
    sequence(:email) { |n| "test#{n}@gmail.com" }
    sequence(:uid) { |n| "uid123#{n}aaaaa" }
    provider 'developer'
    nickname 'test_user1'
    image_url 'http://test.profile.image/test.jpg'
    sequence(:access_token) { |n| "1112233#{n}aaaabbcc" }
    sequence(:secret_token) { |n| "aabbcceedd#{n}1112233" }
  end
end
