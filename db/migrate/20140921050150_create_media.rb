class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.attachment :asset
    end
  end
end
