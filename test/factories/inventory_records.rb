# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory_record do
    user nil
    inventory nil
    inventory_status nil
    location nil
    latitude "MyString"
    longitude "MyString"
  end
end
