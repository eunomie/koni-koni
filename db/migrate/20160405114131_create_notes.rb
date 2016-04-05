class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :occurred_on
      t.text :body
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
