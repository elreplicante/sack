# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    url "http://emxample.com"
    name "Example Item"
    description "Example description"
  end
end
