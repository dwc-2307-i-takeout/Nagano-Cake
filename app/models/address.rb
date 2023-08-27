class Address < ApplicationRecord

  belongs_to :customer

def address_display
  '〒' + post_number + ' ' + address + ' ' + name
end

end
