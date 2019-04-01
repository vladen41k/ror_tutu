class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.belongs_to :first_name
      t.belongs_to :last_name
      t.belongs_to :patronymic
      t.belongs_to :passport_details
      t.belongs_to :train
      t.belongs_to :first_railway_station
      t.belongs_to :last_railway_station
      t.timestamps
    end
  end
end
