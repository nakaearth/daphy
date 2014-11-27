class TopController < ApplicationController
  skip_before_action :login?

  def index
    # pryでstep 実行する場合
    # binding.pry
  end
end
