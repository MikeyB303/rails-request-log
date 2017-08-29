class RequestsController < ApplicationController

  def new
  end  

  def create

    @errors = []

    if params[:requests][:artist] == ''
      @errors << "Please fill in the artist"
    end

    if params[:requests][:song] == ''
      @errors << "Please fill in the song"
    end

    if params[:requests][:genre] == ''
      @errors << "Please fill in the genre"
    end

    artist = new_artist_or_nah(params[:requests][:artist])
    song = new_song_or_nah(params[:requests][:song])
    genre = new_genre_or_nah(params[:requests][:genre])
    source = new_source_or_nah(params[:requests][:source])
    log = new_log_or_nah(Time.now.month, Time.now.year)

    if params[:requests][:age] == ''
      params[:requests][:age] = "N/A"
    end

    if params[:requests][:gender] == 'Gender'
      params[:requests][:gender] = "N/A"
    end

    listener = Listener.new(age: params[:requests][:age], gender: params[:requests][:gender], on_campus?: params[:requests][:on_campus])
    
    if @errors.length > 0
      render new_request_path
    else
      listener.save
      request_params = {
        :song_id => song.id,
        :artist_id => artist.id,
        :genre_id => genre.id,
        :source_id => source.id,
        :requestlog_id => log.id,
        :listener_id => listener.id,
        :in_system? => params[:requests][:in_library]
      }
      request = Request.create(request_params)
      redirect_to requestlog_path(log.id)
    end 
  end

  private
  def request_params
    params.require(:requests).permit(:song_id, :artist_id, :genre_id, :source_id, :requestlog_id, :listener_id, :in_system?)
  end

end