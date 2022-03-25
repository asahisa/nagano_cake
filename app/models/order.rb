class Order < ApplicationRecord
  ##注文詳細
	has_many :order_detail, dependent: :destroy
	##会員id
	belongs_to :Customer
end
