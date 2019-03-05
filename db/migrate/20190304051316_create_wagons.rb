class CreateWagons < ActiveRecord::Migration[5.2]
  def change
    create_table :wagons do |t|
      t.integer :wagon_type, default: 0
      t.belongs_to :train
      t.timestamps
    end
  end
end
