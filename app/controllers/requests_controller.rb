class RequestsController < ApplicationController

  def new
  end  

  def create
    p params[:requests]

    artist = new_artist_or_nah(params[:requests][:artist])
    song = new_song_or_nah(params[:requests][:song])
    genre = new_genre_or_nah(params[:requests][:genre])
    source = new_source_or_nah(params[:requests][:source])
    listener = Listener.create!(age: params[:requests][:age], gender: params[:requests][:gender], on_campus?: params[:requests][:on_campus])
    log = new_log_or_nah(Time.now.month, Time.now.year)

    request_params = {
    :song_id => song.id,
    :artist_id => artist.id,
    :genre_id => genre.id,
    :source_id => source.id,
    :requestlog_id => log.id,
    :listener_id => listener.id,
    :in_system? => params[:requests][:in_library]
    }

    request = Request.new(request_params)
    if request.save
      redirect_to requestlog_path(log.id)
    else
      request.save!
      @errors = ["Something fucked up"]
      render new_request_path
    end  
  end

  private
  def request_params
    params.require(:requests).permit(:song_id, :artist_id, :genre_id, :source_id, :requestlog_id, :listener_id, :in_system?)
  end

end