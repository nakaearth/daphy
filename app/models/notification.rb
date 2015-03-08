class Notification < ActiveRecord::Base
  def self.past_the_fixed_date
    JobCard.find_each do |job|
      Notifications.create(message: '期限が過ぎております', job: job) if job.schedule_day_overdue?
    end
  rescue
    logger.error '処理中にエラーが発生しました。'
  end
end
