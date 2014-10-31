class Album <  ActiveRecord::Base
  validates :name, :band_id, presence: true
  validates :name, uniqueness: { scope: :band_id}

  belongs_to(
    :band,
    class_name: "Band",
    primary_key: :id,
    foreign_key: :band_id
  )

  has_many(
    :tracks,
    class_name: "track",
    foreign_key: :album_id,
    primary_key: :id
  )

end