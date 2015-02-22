class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :area, index: true, null: false
      t.belongs_to :thumbnail

      t.string :title, null: false, default: ''
      t.text :content
      t.integer :status, limit: 1, null: false, default: 0

      t.integer :prefecture, limit: 1, null: false
      t.string :address_1, null: false, default: ''
      t.string :address_2, null: false, default: ''

      t.string :address_code_1, limit: 8, null: false, default: ''
      t.string :address_code_2, limit: 8, null: false, default: ''
      t.string :address_code_3, limit: 8, null: false, default: ''
      t.string :address_code_4, limit: 8, null: false, default: ''
      t.string :address_code_5, limit: 8, null: false, default: ''
      t.string :address_code_6, limit: 8, null: false, default: ''
      t.string :address_code_7, limit: 8, null: false, default: ''
      t.string :address_code_8, limit: 8, null: false, default: ''
      t.integer :address_code_size, limit: 1, null: false, default: 0

      t.timestamps
    end

    add_index :events, :prefecture

    add_index :events, [
      :address_code_1,
      :address_code_2,
      :address_code_3,
      :address_code_4,
      :address_code_5,
      :address_code_6,
      :address_code_7,
      :address_code_8,
    ], name: 'events_address_codes'
  end
end
