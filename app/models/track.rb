class Track < ActiceRecord::Base
  validates :name, :album_id, presence: true
  #note: we have lyrics
  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: album_id,
    primary_key: id
  )



end