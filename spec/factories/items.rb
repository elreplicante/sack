# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    url "http://example.com"
    title "Item"
    description "description"
    id 1234
  end
end
