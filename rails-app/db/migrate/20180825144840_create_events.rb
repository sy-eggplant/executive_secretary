class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.references :kanji, foreign_key: true
      t.datetime :dead_line
      t.boolean :attend_flg
      t.string :url
      t.string :place
      t.integer :total_fee
      t.string :memo
      t.boolean :is_valid
      t.boolean :is_complete
      t.string :pass
      t.boolean :is_edit
      t.timestamps
    end
  end
end
