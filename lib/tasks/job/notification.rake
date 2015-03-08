namespace :job do
  desc 'do not finished job notification'

  task notification: :environment do
    logger = Logger.new("log/notification.log")
    begin
      logger.info '処理を始めます'
      Notification.past_the_fixed_date
      logger.info '終わり'
    rescue => e
      logger.error e
      logger.error '処理中にエラーが発生しました。'
    end
  end
end
