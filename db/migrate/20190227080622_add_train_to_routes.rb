class AddTrainToRoutes < ActiveRecord::Migration[5.2]
  def change
    change_table :trains do |t|
      t.belongs_to :route
    end
  end
end
