FactoryGirl.define do
  factory :course do
    sequence(:code)
    sequence(:name_fi) {|i| "kussi #{i}"}
    sequence(:name_en) {|i| "course #{i}"}
    sequence(:name_se) {|i| "kurs #{i}"}
    credits 60
  end
end
