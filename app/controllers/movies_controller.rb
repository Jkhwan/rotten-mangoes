class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(secure_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(secure_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected
  def secure_params
    params.required(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date)
  end
end
