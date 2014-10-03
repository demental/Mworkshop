# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    grade Settings['grades'].first
    name 'CE1 1'
  end
end
