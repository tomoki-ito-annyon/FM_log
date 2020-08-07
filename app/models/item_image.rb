class ItemImage < ApplicationRecord
  belongs_to :item

  validates :image, presence: true, uniquness: {scope: [:item, :image]}
end
