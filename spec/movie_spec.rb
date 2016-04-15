require_relative '../lib/movie.rb'
require_relative '../lib/fake_imdb.rb'

RSpec.describe "Movie" do

  let(:movie1) {FakeMovie.new("1", "Title1")}
  let(:movie2) {FakeMovie.new("2", "Title2")}
  let(:list1) {FakeList.new}

  it "Creates a correct FakeMove instance" do
    expect(movie1).to be_instance_of(FakeMovie)
  end

  it "Gets correct year" do
    expect(movie1.year).to eq("1999")
  end

  describe ".search" do
    it "fills the array with movies" do
      list1.search("word")
      expect(list1.list.size).to be(14)
    end
  end

  describe ".get_nine_with_poster" do
    it "Selects first 9 movies where poster exists" do
      list1.search("word")
      list1.get_nine_with_poster
      expect(list1.with_posters.size).to be(9)
    end

    it "Selects correct movie objects" do
      list1.search("word")
      list1.get_nine_with_poster
      expect(list1.with_posters[0][:obj]).to be_instance_of(FakeMovie)
    end
  end

  describe ".random_year" do
    it "Selects correct random date" do
      list1.search("word")
      list1.get_nine_with_poster
      expect(list1.random_year).to eq("1999")
    end
  end
end
