class Song < ActiveRecord::Base
  belongs_to :artist, class_name: "Artist"
  belongs_to :genre, class_name: "Genre"
end
