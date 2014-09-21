class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :admin_user_accounts, :admin_users, column: :admin_user_id, dependent: :delete

    add_foreign_key :events, :areas, column: :area_id, dependent: :delete
    add_foreign_key :events, :media, column: :thumbnail_id, dependent: :nullify

    add_foreign_key :event_creators, :events, column: :event_id, dependent: :delete
    add_foreign_key :event_creators, :users, column: :user_id, dependent: :delete

    add_foreign_key :event_organizers, :events, column: :event_id, dependent: :delete
    add_foreign_key :event_organizers, :users, column: :user_id, dependent: :delete

    add_foreign_key :event_dates, :events, column: :event_id, dependent: :delete

    add_foreign_key :event_images, :events, column: :event_id, dependent: :delete
    add_foreign_key :event_images, :media, column: :medium_id, dependent: :delete

    add_foreign_key :taggings, :tags, column: :tag_id, dependent: :delete

    add_foreign_key :user_accounts, :users, column: :user_id, dependent: :delete

    add_foreign_key :users, :media, column: :avatar_id, dependent: :nullify
  end
end
