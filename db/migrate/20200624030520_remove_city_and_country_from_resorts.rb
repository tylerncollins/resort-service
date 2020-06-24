class RemoveCityAndCountryFromResorts < ActiveRecord::Migration[5.2]
  def change
    remove_column :resorts, :city, :string
    remove_column :resorts, :country, :string
  end
end
