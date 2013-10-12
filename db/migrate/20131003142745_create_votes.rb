class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :poll, index: true
      t.references :item, index: true
      t.references :user, index: true
      t.text :comment

      t.timestamps
    end
  end
end
