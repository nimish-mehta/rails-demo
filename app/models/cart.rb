class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product)
    p product
    current_item = line_items.find_by_product_id(product[:product].id)
    p "found current item"
    p current_item
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product: product[:product])
    end
    current_item
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price }
  end

end
