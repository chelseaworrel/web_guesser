require 'sinatra'
require 'sinatra/reloader'

Number = rand(100)

  get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => {:number => Number, :message => message, :background_color => @background_color}
  end

  def check_guess(guess)
    if guess > (Number + 5)
      @background_color = "#FF0000"
      "Way too high!"
    elsif guess > (Number)
      @background_color = "#FFCCCC"
      "Too high!"
    elsif guess < (Number - 5)
      @background_color = "#FF0000"
      "Way too low!"
    elsif guess < (Number)
      @background_color = "#FFCCCC"
      "Too low!"
    else
      @background_color = "#75C575"
      "You got it right! The Secret Number is #{Number}"
    end
  end
