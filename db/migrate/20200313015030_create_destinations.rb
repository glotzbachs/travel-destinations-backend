class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
