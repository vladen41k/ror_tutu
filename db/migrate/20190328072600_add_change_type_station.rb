class AddChangeTypeStation < ActiveRecord::Migration[5.2]
  def change
      change_column :tickets, :first_name_id, :string
      change_column :tickets, :last_name_id, :string
      change_column :tickets, :middle_name_id, :string
  end
end
