class UserQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_quotes do |t|
      t.integer :user_id
      t.integer :quote_id
    end
  end
end
