class AddZoneListToTimingZones < ActiveRecord::Migration
  def change
  	add_column :timingzones, :zone_list, :string
  end
end
