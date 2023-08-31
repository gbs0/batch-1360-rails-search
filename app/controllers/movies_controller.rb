class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #     movies.title @@ :query
    #     OR movies.synopsis @@ :query
    #     OR directors.first_name @@ :query
    #     OR directors.last_name @@ :query
    #   SQL
    #   @movies = @movies.joins(:director).where(sql_subquery, query: "%#{params[:query]}%")
    # end
    if params[:query].present?
      # @movies = @movies.search_by_title_and_sinopsys(params[:query])
      @movies = PgSearch.multisearch(params[:query])
    end
  end
end
