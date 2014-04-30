# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:grade_name) { |n| "CM#{n}" }

  factory :grade do
    name { generate(:grade_name) }
    weight 1
  end
end
