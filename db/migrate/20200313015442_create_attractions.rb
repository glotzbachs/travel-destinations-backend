class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.integer :destination_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
