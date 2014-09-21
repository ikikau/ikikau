class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, index: true, null: false
      t.belongs_to :taggable, polymorphic: true, index: true, null: false
      t.belongs_to :tagger, polymorphic: true, index: true, null: false

      t.string :context
      t.datetime :created_at
    end
  end
end
