FactoryGirl.define do
  factory :job_card do
    title 'My job card'
    description "My job card です"
    type 'Todo'
    point 1
    fixed_at "2014-10-21"

    trait :doing do
      type 'Doing'
    end

    trait :done do
      type 'Done'
    end

    trait :trashed do
      type 'Trashed'
    end
  end

  factory :do_not_finished_todo, class: JobCard do
    title 'My job card'
    description "My job card です"
    type 'Todo'
    point 1
    fixed_at { Date.yesterday }
  end
end
