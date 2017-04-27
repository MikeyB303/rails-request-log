class RequestsController < ApplicationController
  def index
    current_log = new_log_or_nah(Time.now.month, Time.now.year)
    redirect_to request_path(current_log)
  end

  def new
  end

  def create
    artist = new_artist_or_nah(params[:requests][:artist])
    song = new_song_or_nah(params[:requests][:song])
    genre = new_genre_or_nah(params[:requests][:genre])
    source = new_source_or_nah(params[:requests][:source])
    log = new_log_or_nah(Time.now.month, Time.now.year)

    request_params = {
    :song_id => song.id,
    :artist_id => artist.id,
    :genre_id => genre.id,
    :source_id => source.id,
    :requestlog_id => log.id,
    :in_system? => params[:requests][:in_library]
  }
  request = Request.create(request_params)
  redirect_to requests_path  
  end

  def show
    @current_log = Requestlog.find_by id: params[:id]
    @logs = Requestlog.all
    @requests = @current_log.requests
    @month = Date::MONTHNAMES[@current_log.month.to_i]
    @year = @current_log.year
  end

  private
  def request_params
    params.require(:requests).permit(:song_id, :artist_id, :genre_id, :source_id, :requestlog_id, :in_system?)
  end
end