class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
    @song = Song.find(params[:id])
  end
  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      # binding.pry
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end


  private

  def song_params(*args)
    # binding.pry
    (args << [:title,:artist_name,:released,:release_year,:genre]).flatten if args.empty?
    params.require(:song).permit(args)
  end

end
