class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, bank_transfer: 1}
  enum status: { waiting_for_payment: 0, payment_confirmation:1, production:2, preparing_to_ship:3, sent:4}

end
