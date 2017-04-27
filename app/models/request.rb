class Request < ApplicationRecord
  belongs_to :song
  belongs_to :artist
  belongs_to :genre
  belongs_to :source
  belongs_to :requestlog
end
