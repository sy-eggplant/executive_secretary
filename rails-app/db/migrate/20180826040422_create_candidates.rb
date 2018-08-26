class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :event, foreign_key: true
      t.datetime :day
      t.boolean :is_attend
      t.boolean :is_valid
      t.timestamps
    end
  end
end
