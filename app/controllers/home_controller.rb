class HomeController < ApplicationController
  def index
    @dashboard = current_user.global_countability
  end
end
