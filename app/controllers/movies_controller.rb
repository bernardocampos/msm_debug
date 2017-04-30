class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # why does it work here without the render(""...html.erb")?
  end

  def show

    @movie = Movie.find(params[:id])
  end

  def new_form
  end

  def create_row
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    movie = Movie.new
    movie.title = title
    movie.year = year
    movie.duration = duration
    movie.description = description
    movie.image_url = image_url
    movie.director_id = director_id
    movie.save

    redirect_to("/movies/#{movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    id = params[:id]
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    movie = Movie.find(id)
    movie.title = title
    movie.year = year
    movie.duration = duration
    movie.description = description
    movie.image_url = image_url
    movie.director_id = director_id
    movie.save
    redirect_to("/movies/")
  end

  def destroy
    id = params[:id]
    movie = Movie.find(id)
    @movie = movie
    render("/movies/destroy.html.erb")
    movie.destroy
  end
end
