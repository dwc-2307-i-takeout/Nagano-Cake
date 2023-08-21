class Item < ApplicationRecord

  has_many :curt_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
  
  def taxin_price
    price*1.1
  end
end
