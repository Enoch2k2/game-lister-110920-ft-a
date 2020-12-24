class GamesController < ApplicationController
  get '/games' do
    redirect_if_not_logged_in
    @games = current_user.games
    @game = Game.find_by_id(session[:game_id])
    erb :'games/index'
  end

  get '/games/new' do
    redirect_if_not_logged_in
    erb :'games/new'
  end
  
  get '/games/:id' do
    redirect_if_not_logged_in
    find_game
    redirect_if_not_owner
    session[:game_id] = @game.id if @game
    redirect_if_game_not_found
    erb :'games/show'
  end
  
  get '/games/:id/edit' do
    redirect_if_not_logged_in
    find_game
    redirect_if_game_not_found
    redirect_if_not_owner
    erb :'games/edit'
  end
  
  post '/games' do
    game = current_user.games.build(params[:game])
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
    redirect_if_game_not_found
    redirect_if_not_owner
    @game.destroy
    redirect "/games"
  end
  
  private
  def find_game
    @game = Game.find_by_id(params[:id])
  end
  
  def redirect_if_game_not_found
    redirect "/games" unless @game
  end

  def redirect_if_not_owner
    redirect "/games" unless @game.user == current_user
  end
end