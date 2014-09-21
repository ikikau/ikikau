class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.belongs_to :avatar

      t.string :name, null: false

      t.timestamps
    end
  end
end
