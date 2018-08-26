class CreatePeopleDates < ActiveRecord::Migration[5.1]
  def change
    create_table :people_dates do |t|
      t.references :event_person, foreign_key: true
      t.references :candidate, foreign_key: true
      t.string :memo
      t.integer :status
      t.timestamps
    end
  end
end
