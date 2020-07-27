class Artist < ActiveRecord::Base
  has_many :songs, foreign_key: :artist_id
  has_many :genres, through: :songs
end
