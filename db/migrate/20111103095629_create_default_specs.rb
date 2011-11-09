class CreateDefaultSpecs < ActiveRecord::Migration
  def self.up
    create_table :default_specs do |t|
      t.integer :product_type_id
      t.integer :specification_id
      t.boolean :required
    end
  end

  def self.down
    drop_table :default_specs
  end
end
