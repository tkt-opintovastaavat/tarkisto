FactoryGirl.define do
  factory :exam do
    type_id 1
    course_id 2
    maximum_points 60
    date Date.today
  end
end
