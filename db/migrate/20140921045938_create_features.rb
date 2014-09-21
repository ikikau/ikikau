class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :status, limit: 1, null: false, default: 0
      t.string :title, null: false, default: ''
      t.text :content

      t.timestamps
    end
  end
end
