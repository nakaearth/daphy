ENV['RAILS_ENV'] ||= 'test'
ENV['TEST_QUEUE_STATS'] ||= File.expand_path('../tmp/.test_queue_stats', __FILE__)

require File.expand_path('../config/environment', __FILE__)

require 'test_queue'
require 'test_queue/runner/rspec'

class MyAppRSpecRunner < TestQueue::Runner::RSpec
  def after_fork(num)
    ENV.update('TEST_ENV_NUMBER' => num.to_s)

    ActiveRecord::Base.configurations['test']['database'] << num.to_s
    ActiveRecord::Base.establish_connection(:test)

    ActiveRecord::Tasks::DatabaseTasks.drop_current
    ActiveRecord::Tasks::DatabaseTasks.create_current
    ActiveRecord::Tasks::DatabaseTasks.load_schema_current

    ::RSpec.configure do |config|
      config.formatter = :documentation # :progress, :html, :textmate
    end

    SimpleCov.at_exit do
      SimpleCov.result
      exit! 0
    end
  end

  def summarize
    estatus = @completed.inject(0) { |a,e | s + e.status.exitstatus }
    estatus = 255 if estatus > 255
    exit(estatus)
  end

  def run_worker(iterator)
    @run_worker_ret = super
  end

  def cleanup_worker
    Kernel.exit @run_worker_ret if @run_worker_ret
  end
end

MyAppRSpecRunner.new.execute
