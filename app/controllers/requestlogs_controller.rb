class RequestlogsController < ApplicationController
  def index
  end

  def show
    @current_log = Requestlog.find_by id: params[:id]
    @logs = Requestlog.all
    @requests = @current_log.requests
    @month = Date::MONTHNAMES[@current_log.month.to_i]
    @year = @current_log.year
    artists = Artist.all
    songs = Song.all
    genres = Genre.all
    sources = Source.all
    
    @current_artists = []
    artists.each do |artist|
      if artist.requests.find_by(requestlog_id: @current_log.id)
        @current_artists << artist
      end
    end
    
    @current_songs = []
    songs.each do |song|
      if song.requests.find_by(requestlog_id: @current_log.id)
        @current_songs << song
      end
    end
    
    @current_genres = []
    genres.each do |genre|
      if genre.requests.find_by(requestlog_id: @current_log.id)
        @current_genres << genre
      end
    end
    
    @current_sources = []
    sources.each do |source|
      if source.requests.find_by(requestlog_id: @current_log.id)
        @current_sources << source
      end
    end

  end

end