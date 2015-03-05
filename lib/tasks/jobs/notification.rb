module Job
  class Notification
    def past_the_fixed_date
      JobCard.find_each do |job|
        if job.schedule_day_overdue?
          # TODO: ここに処理を書く
          # Notifications.create(message: '期限が過ぎております')
        end
      end
    rescue
      logger.error '処理中にエラーが発生しました。'
    end
  end
end
