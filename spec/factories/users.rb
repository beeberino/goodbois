FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "owner#{n}@test.com"
    end
    password { 'password' }
  end
end
