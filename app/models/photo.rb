class Photo < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, format: {:with => /\.(png|jpg|jpeg)\Z/i}
end
