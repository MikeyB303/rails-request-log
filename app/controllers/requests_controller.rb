class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
  end

  def create
    artist = new_artist_or_nah(params[:artist])
    song = new_song_or_nah(params[:song])
    genre = new_genre_or_nah(params[:genre])
    source = new_source_or_nah(params[:source])


    request_params = {
      :song_id => song.id,
      :artist_id => artist.id,
      :genre_id => genre.id,
      :source_id => source.id,
      :in_system? => params[:library?]
    }
    request = Request.create(request_params)
    redirect_to requests_route
  end

  private
  def request_params
    params.require(:requests).permit(:song_id, :artist_id, :genre_id, :source_id, :in_system?)
  end
end