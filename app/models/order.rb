class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email,  presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
