class TopController < ApplicationController
  skip_before_action :login?

  def index
  end
end
