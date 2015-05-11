require 'sinatra'
require 'sinatra/reloader'


  Number = rand(100)

  get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => {:number => Number, :message => message}
  end

  def check_guess(guess)
    if guess > (Number + 5)
      "Way too high!"
    elsif guess > (Number)
      "Too high!"
    elsif guess < (Number - 5)
      "Way too low!"
    elsif guess < (Number)
    else
      "You got it right! The Secret Number is #{Number}"
    end
  end
