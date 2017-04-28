class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :new_artist_or_nah, :new_song_or_nah, :new_genre_or_nah, :new_source_or_nah, :new_month_or_nah

  # Could probably smash these into some kind of
  # new_entry_or_nah that would take an object name and param
  def new_artist_or_nah(request_artist)
    artist = Artist.find_by name: request_artist
    if artist == nil
      Artist.create(name: request_artist)
    else
      artist
    end 
  end

  def new_song_or_nah(request_song)
    song = Song.find_by title: request_song
    if song == nil
      Song.create(title: request_song)
    else
      song
    end 
  end

  def new_genre_or_nah(request_genre)
    genre = Genre.find_by title: request_genre
    if genre == nil
      Genre.create(title: request_genre)
    else
      genre
    end 
  end

  def new_source_or_nah(request_source)
    source = Source.find_by name: request_source
    if source == nil
      Source.create(name: request_source)
    else
      source
    end 
  end 

  def new_log_or_nah(current_month, current_year)
    log = Requestlog.find_by(month: current_month.to_s, year: current_year.to_s)
    if log == nil
      Requestlog.create(month: current_month.to_s, year: current_year.to_s)
    else
      log
    end     
  end

end
