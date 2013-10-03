class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :poll, index: true
      t.string :caption
      t.string :photo

      t.timestamps
    end
  end
end
