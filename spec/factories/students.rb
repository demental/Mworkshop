# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    group
    first_name "Marcus"
    last_name "Garvey"
    happiness 1
  end
end
