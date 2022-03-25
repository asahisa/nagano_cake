class CartItem < ApplicationRecord
  ##商品id
	belongs_to :item
	##会員id
	belongs_to :Customer
end
