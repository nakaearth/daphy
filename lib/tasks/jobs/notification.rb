namespace :job do
  task :notification => :environment do
    JobCard.find_each do |job|
      Notifications.past_the_fixed_date
    end
  rescue
    logger.error '処理中にエラーが発生しました。'
  end
end
