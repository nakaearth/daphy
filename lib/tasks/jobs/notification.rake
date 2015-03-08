namespace :job do
  desc 'do not finished job notification'

  task :notification => :environment do
    logger = Logger.new("log/notification.log")
    begin
      JobCard.find_each do |job|
        Notification.past_the_fixed_date
      end
      logger.info '終わり'
    rescue => e
      logger.error '処理中にエラーが発生しました。'
    end
  end
end
