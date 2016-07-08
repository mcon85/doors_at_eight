class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :review, index: true, null: false
      t.string :vote_type, null: false
    end
  end
end
