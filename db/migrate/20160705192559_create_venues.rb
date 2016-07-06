class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.integer :capacity
      t.string :website
      t.string :address, null: false
      t.boolean :t_accessible, null: true, default: false
    end
  end
end
