class AddEmergencyCodeToResponders < ActiveRecord::Migration
  def change
    add_column :responders, :emergency_code, :integer
  end
end
