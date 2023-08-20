class Item < ApplicationRecord

  has_many :curt_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def tax_included
    tax = 1.1
    (price * tax).floor
  end

  def item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end

end
