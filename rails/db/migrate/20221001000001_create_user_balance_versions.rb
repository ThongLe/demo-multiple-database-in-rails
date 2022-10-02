class CreateUserBalanceVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_balance_versions do |t|
      t.bigint :user_balance_id
      t.jsonb :data
      t.decimal :balance
      t.jsonb :reason

      t.timestamps
    end
    add_index :user_balance_versions, :user_balance_id
  end
end
