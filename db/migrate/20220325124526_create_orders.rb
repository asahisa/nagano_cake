class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      ##配送先郵便番号
      t.string :postal_code, null: false
      ##配送先住所
      t.string :address, null: false
      ##配送先宛名
      t.string :name, null: false
      ##送料
      t.integer :postage, null: false
      ##支払金額
      t.integer :total_payment, null: false
      ##支払方法
      t.integer :payment_method, null: false

      ##注文ステータス　任意
      # t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
