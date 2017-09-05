class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy

  def as_json(options={})
    super(:only => [:id, :name, :description, :price])
  end
end
