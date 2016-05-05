class TeamHasManyMoods < ActiveRecord::Migration
  def change
    remove_reference :teams, :mood
    add_reference :moods, :team, index: true, foreign_key: true
  end
end
