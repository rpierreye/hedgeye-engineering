class CreateEventsEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events do |t|
      t.string :title
      t.datetime :date
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :photo_id
      t.text :description
      t.text :teaser
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

  end

end
