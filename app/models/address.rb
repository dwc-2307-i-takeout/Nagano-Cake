class Address < ApplicationRecord

  belongs_to :customer

  validates :post_number, presence: true, length: { is:7}
  validates :address, presence: true
  validates :name, presence: true

  def customer_address
    "〒" + " " + post_number + " " + address + " " + name
  end

end
