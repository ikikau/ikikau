class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :area, index: true, null: false
      t.belongs_to :thumbnail

      t.string :title, null: false, default: ''
      t.text :context
      t.integer :status, limit: 1, null: false, default: 0
      t.string :location_name, null: false, default: ''
      t.integer :prefecture, limit: 1, index: true, null: false
      t.string :postal_code, limit: 7
      t.string :address, null: false, default: ''

      t.timestamps
    end
  end
end
