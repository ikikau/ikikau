class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false, default: ''
      t.integer :taggings_count, null: false, default: 0
    end
  end
end
