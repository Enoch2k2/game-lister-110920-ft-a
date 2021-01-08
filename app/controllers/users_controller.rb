class UsersController < ApplicationController
  get '/users/:id' do
    find_user
    erb :'users/show'
  end

  private
    def find_user
      @user = User.find_by_id(params[:id])
    end
end