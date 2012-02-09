# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exam_builder do
    exam_id 1
    user_id 1
    state "MyString"
  end
end
