class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	##カート内商品id
	has_many :cart_item
	##注文id
	has_many :order

	##配送先id　任意
# 	has_many :addresses

 # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_active == false)
  end

end
