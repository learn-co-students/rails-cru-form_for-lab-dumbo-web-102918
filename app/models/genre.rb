class Genre < ActiveRecord::Base
  has_many :songs, foreign_key: :genre_id
  has_many :artists, through: :songs
end
