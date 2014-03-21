# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    name "MyString"
    instructor "MyString"
    day "MyString"
    max_attendees 1
  end
end
