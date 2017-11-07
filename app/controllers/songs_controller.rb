class SongsController < ApplicationController
  def set_song
    @song = Song.find(params[:id])
  end
  helper_method :set_song

  before_action :set_song, only: [:show, :edit, :destroy, :update]

  def index
    @songs = Song.all
  end
  def show
  end

  def new
    @song = Song.new
    # if @song.save
    #   # redirect_to song_path(@song)
    # else
    #   render :new
    # end
  end
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
