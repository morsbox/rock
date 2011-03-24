class CreateStaticPages < ActiveRecord::Migration
  def self.up
    create_table :static_pages do |t|
      t.references :author
      t.string :title
      t.boolean :show_title, :default=>true
      t.text :content
      t.string :url_match
      t.integer :order_on_main,  :default=>0
      t.integer :order_in_group, :default=>0
      t.integer :access_level,   :default=>0
      

      t.timestamps
    end
    
    add_index :static_pages, :url_match, :unique => true
  end

  def self.down
    drop_table :static_pages
  end
end
