FactoryGirl.define do
  factory :job_card do
    title 'My job card'
    description "My job card です"
    type 'todo'
    point 1
    schedule_end_date "2014-10-21"

    trait :doing do
      type 'doing'
    end

    trait :done do
      type 'done'
    end
  end

end
