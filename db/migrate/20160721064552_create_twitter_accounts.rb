class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :username
      t.string :twitter_id
      t.string :display_name

      t.timestamps null: false
    end
  end
end
