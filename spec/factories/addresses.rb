# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line_1 "MyString"
    line_2 "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
  end
end
