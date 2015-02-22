class CreateEventOrganizers < ActiveRecord::Migration
  def change
    create_table :event_organizers do |t|
      t.belongs_to :event, index: false, null: false
      t.belongs_to :organizer, index: false, null: false
    end
  end
end
