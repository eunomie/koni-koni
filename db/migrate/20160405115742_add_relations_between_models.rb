class AddRelationsBetweenModels < ActiveRecord::Migration
  def change
    add_reference :teams, :note, index: true, foreign_key: true
    add_reference :users, :organization, index: true, foreign_key: true
    add_reference :users, :team, index: true, foreign_key: true
    add_reference :teams, :mood, index: true, foreign_key: true
  end
end
