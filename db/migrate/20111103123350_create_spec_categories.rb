class CreateSpecCategories < ActiveRecord::Migration
  def self.up
    create_table :spec_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :spec_categories
  end
end
