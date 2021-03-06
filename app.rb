require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

class Battle < Sinatra::Base
  
  enable :sessions

  Capybara.app = Battle

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    erb(:play)
  end

  post '/names' do
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    redirect '/play'
  end

end
