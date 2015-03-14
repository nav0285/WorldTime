class CreateTimingzones < ActiveRecord::Migration
  def change
    create_table :timingzones do |t|
			t.string :country
			t.string :state
			t.boolean :dst
      t.timestamps
    end
  end
end
