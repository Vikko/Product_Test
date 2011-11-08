class CreateProductSpecs < ActiveRecord::Migration
  def self.up
    create_table :product_specs do |t|
      t.integer :spec_id
      t.string :value
      t.integer :product_id
      t.boolean :required
      t.timestamps
    end
  end

  def self.down
    drop_table :product_specs
  end
end
