class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { in: 3..14 }

  validates :content,
    presence: true

	belongs_to :user
	has_many :comments
	has_many :likes
	has_many :gossips_tags
	has_many :tags, through: :gossips_tags

end
