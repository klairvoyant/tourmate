class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :name
      t.string :catagory
      t.string :lng
      t.string :lat
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
