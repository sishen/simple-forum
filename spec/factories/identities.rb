# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do |ident|
    email
    sequence(:name) { |n| "Identity Name #{n}" }

    password "password"

    ident.after(:create) do |instance|
      User.from_auth({ 'provider' => 'identity', 'uid' => instance.id, 'info' => instance.info })
    end
  end
end
