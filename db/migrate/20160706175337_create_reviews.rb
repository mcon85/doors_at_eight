class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body, null: false
      t.belongs_to :user, index: true
      t.belongs_to :venue, index: true
    end
  end
end
