class AddIndexToResorts < ActiveRecord::Migration[5.2]
  def change
    Resort.where.not(id: Resort.group(:name).select("min(id)")).destroy_all
    add_index :resorts, :name, :unique => true
  end
end
