FactoryGirl.define do
  sequence(:period_name){ | n | "period_#{n}_#{rand(1000000)}" }
end