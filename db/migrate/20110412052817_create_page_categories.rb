class CreatePageCategories < ActiveRecord::Migration
  def self.up
    create_table :page_categories do |t|
      t.string :title, :null => false
      t.integer :access_level, :default => 0
      t.boolean :enabled, :default=> true
      
      t.references :parent_category

      t.timestamps
    end
  end

  def self.down
    drop_table :page_categories
  end
end
