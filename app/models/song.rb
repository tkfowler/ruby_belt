class Song < ApplicationRecord
  belongs_to :user
  has_many :playlists
  has_many :users_added, through: :playlists, source: :user
  validates :title, :artist, presence: true, length: {minimum: 2}
end
