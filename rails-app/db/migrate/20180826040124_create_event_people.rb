class CreateEventPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :event_people do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :pass
      t.boolean :is_pay
      t.boolean :is_kanji_pay
      t.integer :fee
      t.timestamps
    end
  end
end
