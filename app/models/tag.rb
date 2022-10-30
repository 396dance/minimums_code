class Tag < ApplicationRecord

  has_many :outfit_tags, dependent: :destroy
  has_many :outfits, through: :outfit_tags, dependent: :destroy

end
