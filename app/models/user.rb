class User < ApplicationRecord
  has_secure_password
  has_many :playlists
  has_many :songs_added, through: :playlists, source: :song
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: { with: email_regex }
  validates :password, presence:true, length: { minimum: 8 }, on: :create
end
