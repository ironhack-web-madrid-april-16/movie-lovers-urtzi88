require 'imdb'

class MovieList
  attr_reader :list, :with_posters
  def initialize
    @list = []
    @with_posters = []
  end

  def search(word)
    i = Imdb::Search.new(word)
    @list = i.movies
  end

  def get_nine_with_poster
    index = 0
    movies = 0
    @with_posters = []
    while index < 9
      if @list[movies].poster
        @temp = {
          :obj => @list[movies],
          :title => @list[movies].title,
          :poster => @list[movies].poster,
          :year => @list[movies].year
        }
        @with_posters << @temp
        movies += 1
        index += 1
      else
        movies += 1
      end
    end
  end

  def random_year
    position = rand(@with_posters.length)
    random_year = @with_posters[position][:year]
  end
end
