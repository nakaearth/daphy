require 'rails_helper'

describe 'job:notification' do
  include_context 'rake'
  
  describe 'rake job:notification' do
    let(:todo_job_card) { create(:job, :do_not_finished_todo) }

    before do
    end

    it 'rake task' do
      subject.invoke
    end
  end
end
