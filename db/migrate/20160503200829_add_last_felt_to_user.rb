class AddLastFeltToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_felt_on, :Date
  end
end
