class User < ActiveRecord::Base
  has_many :games
  has_secure_password

  validates :username, presence: true, uniqueness: true

  # def search_games(query)
  #   self.games.where("title LIKE ?", "%#{query}%")
  # end
end
