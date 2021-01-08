class User < ActiveRecord::Base
  has_many :user_games
  has_many :games, through: :user_games
  
  has_secure_password

  validates :username, presence: true, uniqueness: true

  # def search_games(query)
  #   self.games.where("title LIKE ?", "%#{query}%")
  # end

 
end
