# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :period do
    name { generate :period_name }
    state "open"
  end

end
