require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = [*("A".."Z")].sample(10)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    wordhash = JSON.parse(open(url).read)
    if wordhash["found"]
      @answer = "Congratulations! #{@word} is a perfect word!"
    elsif
      @word != @letters
      @answer = "Sorry but that can't be made from the given letters"
    else
      @answer = "Sorry #{@word} does not seem to be a valid English word"
    end
  end
end
