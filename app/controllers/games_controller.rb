class GamesController < ApplicationController
  require "json"
  require "open-uri"

  def new
    alphabet = Array('A'..'Z')
    @letters = Array.new(10) { alphabet.sample }
  end

  def score
    grid = params[:letters].split
    answer = params[:answer].upcase.split(//)

    @is_include = answer.all? do |letter|
      answer.count(letter) <= grid.count(letter)
    end
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    @is_english = JSON.parse(URI.open(url).read)["found"]
  end
end
