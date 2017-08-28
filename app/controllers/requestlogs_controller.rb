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
    listener_demographics = Listener.all
    
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

    @current_listener_demographics = []
    listener_demographics.each do |listener|
      if listener.request.requestlog_id == @current_log.id
        @current_listener_demographics << listener
      end
    end
    
    listener_age_total = 0
    @current_listener_demographics.each do |listener|
      if listener.age.to_i != false
        listener_age_total += listener.age.to_i
      end
    end
    @listener_average_age = listener_age_total / @current_listener_demographics.length

    
    @current_male_listeners = 0
    @current_female_listeners = 0
    @current_other_gendered_listeners = 0
    @current_listener_demographics.each do |listener|
      if listener.gender == "Male"
        @current_male_listeners += 1
      elsif listener.gender == "Female"
        @current_female_listeners += 1
      else
        @current_other_gendered_listeners += 1
      end
    end
    @current_ISU_students = 0
    @current_non_ISU_students = 0
    @current_listener_demographics.each do |listener|
      if listener.on_campus? == true
        @current_ISU_students += 1
      else
        @current_non_ISU_students += 1
      end
    end
  end
end