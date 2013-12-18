# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sak do
    items { [FactoryGirl.build(:item)] }
  end
end
