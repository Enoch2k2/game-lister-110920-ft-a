class GamesController < ApplicationController
  get '/games' do
    @games = Game.all
    erb :'games/index'
  end

  get '/games/new' do
    erb :'games/new'
  end
  
  get '/games/:id' do
    find_game
    redirect_if_game_not_found
    erb :'games/show'
  end
  
  get '/games/:id/edit' do
    find_game
    redirect_if_game_not_found
    erb :'games/edit'
  end
  
  post '/games' do
    game = Game.new(params[:game])
    
    if game.save
      redirect '/games'
    else
      redirect '/games/new'
    end
  end
  
  patch "/games/:id" do
    find_game
    redirect_if_game_not_found
    if @game.update(params[:game])
      redirect "/games/#{@game.id}"
    else
      redirect "/games/#{@game.id}/edit"
    end
  end
  
  delete '/games/:id' do
    find_game
    @game.destroy if @game
    redirect "/games"
  end
  
  private
  def find_game
    @game = Game.find_by_id(params[:id])
  end
  
  def redirect_if_game_not_found
    redirect "/games" unless @game
  end
end