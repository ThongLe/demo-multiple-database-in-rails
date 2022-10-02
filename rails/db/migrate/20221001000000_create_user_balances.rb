class CreateUserBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :user_balances do |t|
      t.bigint :user_id
      t.string :coin
      t.decimal :balance

      t.timestamps
    end
  end
end
