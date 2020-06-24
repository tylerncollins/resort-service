class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :country
      t.string :google_place_id

      t.timestamps
    end
  end
end
