class CreateFbPages < ActiveRecord::Migration
  def change
    create_table :fb_pages do |t|
      t.string :page_id
      t.string :page_name

      t.timestamps null: false
    end
  end
end
