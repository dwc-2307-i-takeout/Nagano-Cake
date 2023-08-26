class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true

  def total_price
    item.tax_included * quantity
  end

end
