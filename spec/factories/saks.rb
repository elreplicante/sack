# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sak do
    items { [build(:item), build(:item)] }
  end
end
