class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  enum is_sale: [:販売可, :販売不可]
end
