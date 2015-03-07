require 'rails_helper'

describe 'jobs::notification' do
  include_context 'rake'
  
  describe 'rake jobs::notification' do
    let(:todo_job_card) { create(:job, :do_not_finished_todo) }

    before do
      subject.invoke
    end
    it '' do
    end
  end

end
