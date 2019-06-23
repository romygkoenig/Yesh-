class AddUserToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_reference :performances, :user, foreign_key: true
  end
end
