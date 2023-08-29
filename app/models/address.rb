class Address < ApplicationRecord

  belongs_to :customer

  def address_display
  display = '〒'
  display += post_number if post_number
  display += ' ' + address if address
  display += ' ' + name if name
  display
  end

end