class AddIndexToTrains < ActiveRecord::Migration[5.2]
  def change

    add_index :wagons, %i[id type]
  end
end