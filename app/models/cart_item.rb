class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  
  validates :quantity, presence: true
  
  def total_price
    item.tax_included * quantity
  end

def sum_price 
  item.taxin_price*quantity
end

end
