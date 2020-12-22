class Game < ActiveRecord::Base
  validates_presence_of :title, :release_date, :genre
end
