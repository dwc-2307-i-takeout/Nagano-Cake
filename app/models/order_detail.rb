class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: { not_start: 0, waiting_for_production: 1, production:2, complete_production:3}

end
