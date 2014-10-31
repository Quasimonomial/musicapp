class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many(
    :albums,
    class_name: "Album",
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :band_id
  )


end