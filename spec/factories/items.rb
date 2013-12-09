# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    url "example.com"
    name "Example Item"
    description "Example description"
  end
end
