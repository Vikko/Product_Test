class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string  :name
      t.integer :spec_type
      t.integer :spec_category_id
      t.string  :spec_default
      t.string  :units
      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
