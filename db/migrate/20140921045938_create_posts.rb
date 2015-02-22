class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :thumbnail

      t.integer :kind, limit: 1, null: false, default: 0
      t.integer :status, limit: 1, null: false, default: 0
      t.string :title, null: false, default: ''
      t.text :content

      t.timestamps
    end
  end
end
