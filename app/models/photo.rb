class Photo < ApplicationRecord
  validates :place, :url, presence: true
  validates :url, format: {:with => /\.(png|jpg)\Z/i}
end
