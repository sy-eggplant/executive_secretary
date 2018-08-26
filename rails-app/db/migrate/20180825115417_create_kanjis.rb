class CreateKanjis < ActiveRecord::Migration[5.1]
  def change
    create_table :kanjis do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :pass
      t.timestamps
    end
  end
end
