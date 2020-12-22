class GamesController < ApplicationController
  get '/games' do
    @games = Game.all
    erb :'games/index'
  end

  
  get '/games/new' do
    erb :'games/new'
  end
  
  get '/games/:id' do
    @game = Game.find_by_id(params[:id])
    erb :'games/show'
  end

  post '/games' do
    game = Game.new(params[:game])

    if game.save
      redirect '/games'
    else
      redirect '/games/new'
    end
  end
end