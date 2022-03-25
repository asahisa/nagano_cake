class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      ##カート内数量
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
