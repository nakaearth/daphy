FactoryGirl.define do
  factory :job_folder do
    association :group

    name 'テストフォルダー'    
  end

end
