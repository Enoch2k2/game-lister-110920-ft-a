class Game < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :release_date, :genre

  # scope method
  def self.search(query)
    where("title LIKE ?", "%#{query}%")
  end

  def self.alphabetize
    order(title: :asc)
  end
end
