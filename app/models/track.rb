class Track < ActiveRecord::Base
  validates :name, presence: true
  validates :album_id, presence: true
  validates :track_type, presence: true, inclusion: { in: ["regular", "bonus"] }

  belongs_to :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id

  has_many :notes,
    class_name: "Note",
    foreign_key: :track_id,
    primary_key: :id
end
