module Job
  class Notification
    def past_the_fixed_date
      JobCard.find_each do |job|
        if job.past_the_fixed_date?
          # TODO: ここに処理を書く
        end
      end
    end
  end
end
