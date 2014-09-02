# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    grade Settings['grades'].first
    name 'CP1'
  end
end
