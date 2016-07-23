class CreateTwitterAccountSnapshots < ActiveRecord::Migration
  def change
    create_table :twitter_account_snapshots do |t|
      t.integer :followers_count
      t.integer :following_count
      t.integer :like_count
      t.integer :tweets
      t.references :twitter_account, index: true, foreign_key: true
      t.date :snapshot_date

      t.timestamps null: false
    end
    add_index :twitter_account_snapshots, :snapshot_date, unique: true
  end
end
