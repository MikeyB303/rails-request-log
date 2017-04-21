class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :new_artist_or_nah, :new_song_or_nah, :new_genre_or_nah, :new_source_or_nah
  
  def new_artist_or_nah(artist_params)
    artist = Artist.find_by name: artist_param
    if artist == nil
      Artist.create(name: artist_param)
    else
      artist
    end
  end

  def new_song_or_nah(song_params)
    song = Song.find_by title: song_param
    if song == nil
      Song.create(title: song_param)
    else
      song
    end
  end

  def new_genre_or_nah(genre_params)
    genre = Genre.find_by title: genre_param
    if genre == nil
      Genre.create(title: genre_param)
    else
      genre
    end
  end

  def new_source_or_nah(source_params)
    source = Source.find_by name: source_param
    if source == nil
      Source.create(name: source_param)
    else
      source
    end
  end

  private
  def arist_params
    params.require(:artists).permit(:name)
  end

  def song_params
    params.require(:songs).permit(:title)
  end

  def genre_params
    params.require(:genres).permit(:title)
  end

  def source_params
    params.require(:sources).permit(:name)
  end  

end
