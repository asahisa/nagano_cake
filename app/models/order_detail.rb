class OrderDetail < ApplicationRecord
  ##注文id
	belongs_to :order
	##商品id
	belongs_to :item
end
