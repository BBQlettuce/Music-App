class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :band_id, presence: true
end
