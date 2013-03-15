# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    stockenumber "MyString"
    name "MyString"
    description "MyText"
    barcode "MyString"
    purchase_date "2013-03-15"
  end
end
