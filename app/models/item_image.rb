class ItemImage < ApplicationRecord
  belongs_to :item

  validates :image, presence: true, uniquness: {scope: [:item, :image]}

  mount_uploader :image, ImageUploader
end
