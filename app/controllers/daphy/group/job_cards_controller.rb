module Daphy
  module Group
    class JobCardsController < ApplicationController
      def index
        @todos = current_user.my_job_cards.todos.where(group: @group).page(1).per(20)
        @doings = current_user.my_job_cards.doings.where(group: @group).page(1).per(20)
        @dones = current_user.my_job_cards.dones.where(group: @group).page(1).per(20)
      end

      private

      def set_group
        @group = Group.find(params[:group_id])
      end
    end
  end
end
