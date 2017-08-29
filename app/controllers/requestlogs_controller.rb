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
    @artist_request_totals = @requests.group(:artist_id).count
    @current_artists = @current_artists.sort_by {|artist| -@artist_request_totals[artist.id]}
    
    @current_songs = []
    songs.each do |song|
      if song.requests.find_by(requestlog_id: @current_log.id)
        @current_songs << song
      end
    end
    @song_request_totals = @requests.group(:song_id).count
    @current_songs = @current_songs.sort_by {|song| -@song_request_totals[song.id]}
    
    @current_genres = []
    genres.each do |genre|
      if genre.requests.find_by(requestlog_id: @current_log.id)
        @current_genres << genre
      end
    end
    @genre_request_totals = @requests.group(:genre_id).count
    @current_genres = @current_genres.sort_by {|genre| -@genre_request_totals[genre.id]}
    
    @current_sources = []
    sources.each do |source|
      if source.requests.find_by(requestlog_id: @current_log.id)
        @current_sources << source
      end
    end
    @source_request_totals = @requests.group(:source_id).count
    @current_sources = @current_sources.sort_by {|source| -@source_request_totals[source.id]}

    @current_listener_demographics = []
    listener_demographics.each do |listener|
      if listener.request.requestlog_id == @current_log.id
        @current_listener_demographics << listener
      end
    end
    
    listener_age_total = 0
    valid_listeners = 0
    @current_listener_demographics.each do |listener|
      if listener.age != "N/A"
        valid_listeners += 1
        listener_age_total += listener.age.to_i
      end
    end
    if listener_age_total != 0
      @listener_average_age = listener_age_total / valid_listeners
    end

    
    @current_male_listeners = 0
    @current_female_listeners = 0
    @current_other_gendered_listeners = 0
    @current_listener_demographics.each do |listener|
      if listener.gender != "N/A"
        if listener.gender == "Male"
          @current_male_listeners += 1
        elsif listener.gender == "Female"
          @current_female_listeners += 1
        else
          @current_other_gendered_listeners += 1
        end
      end
    end
    @current_ISU_students = 0
    @current_non_ISU_students = 0
    @current_listener_demographics.each do |listener|
      if listener.gender != "N/A" || listener.age != "N/A"
        if listener.on_campus? == true
          @current_ISU_students += 1
        else
          @current_non_ISU_students += 1
        end
      end
    end
  end
end