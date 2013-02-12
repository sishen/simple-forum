FactoryGirl.define do
  factory :authentication do
    user
    provider 'github'
    sequence(:uid) { |n| n }
  end
end
