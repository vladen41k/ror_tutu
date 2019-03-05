class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :first_railway_station
      t.belongs_to :last_railway_station
      t.timestamps
    end
  end
end
