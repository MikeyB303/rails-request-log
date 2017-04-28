class RequestlogsController < ApplicationController
  def index
  end

  def show
    @current_log = Requestlog.find_by id: params[:id]
    @logs = Requestlog.all
    @requests = @current_log.requests
    @month = Date::MONTHNAMES[@current_log.month.to_i]
    @year = @current_log.year
  end

end