class AddUserToVenue < ActiveRecord::Migration
  def change
    add_reference :venues, :user, index: true
    add_foreign_key :venues, :users
  end
end
