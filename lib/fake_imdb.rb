class FakeMovie
  attr_reader :id, :title, :url
  def initialize(id, title)
    @id = id
    @title = title
    @url = "http://www.imdb.com/" + @id + "/title/" + @title
  end

  def poster
    poster_url = "http://www.imdb.com/" + @id + "/poster/" + @title
  end

  def year
    year = "1999"
  end
end

class FakeList
  attr_reader :list, :with_posters
  def initialize
    @list = []
    @with_posters = []
  end

  def search(word)
    @list = [
      FakeMovie.new("1", "Title1"),
      FakeMovie.new("2", "Title2"),
      FakeMovie.new("3", "Title3"),
      FakeMovie.new("4", "Title4"),
      FakeMovie.new("5", "Title5"),
      FakeMovie.new("6", "Title6"),
      FakeMovie.new("7", "Title7"),
      FakeMovie.new("8", "Title8"),
      FakeMovie.new("9", "Title9"),
      FakeMovie.new("10", "Title10"),
      FakeMovie.new("11", "Title11"),
      FakeMovie.new("12", "Title12"),
      FakeMovie.new("13", "Title13"),
      FakeMovie.new("14", "Title14")
    ]
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
