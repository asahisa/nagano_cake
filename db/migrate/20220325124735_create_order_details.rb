class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      ##注文時の価格 (税込)
      t.integer :price, null: false
      ##注文数量
      t.integer :amount, null: false

      ##製作ステータス　任意
      # t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
