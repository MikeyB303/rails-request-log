class HomeController < ApplicationController
  def index
    @current_log = new_log_or_nah(Time.now.month, Time.now.year)
  end
end