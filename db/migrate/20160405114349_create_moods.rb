class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.date :felt_on
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
