class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true
      t.string :vote_type, null: false
    end
  end
end
