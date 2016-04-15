#spec/server_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__
require_relative '../lib/fake_imdb.rb'

RSpec.describe 'Movie Lovers' do

  @@list = FakeList.new

  describe "index" do
    it "loads index correctly" do
      get('/')
      expect(last_response).to be_ok
    end
  end

  describe "movies" do
    it "loads movies correctly" do
      post('/movies', {:word => "test"})
      expect(last_response).to be_ok
    end
  end
end
