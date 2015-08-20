class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :band_id, presence: true
  validates :record_type, presence: true, inclusion: { in: ["studio", "live"] }

  belongs_to :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id

  has_many :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id,
    dependent: :destroy
end
