class CreateFbPageSnapshots < ActiveRecord::Migration
  def change
    create_table :fb_page_snapshots do |t|
      t.references :fb_page, index: true, foreign_key: true
      t.date :snapshot_date
      t.integer :page_likes

      t.timestamps null: false
    end
  end
end
