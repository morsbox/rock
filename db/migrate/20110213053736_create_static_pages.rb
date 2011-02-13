class CreateStaticPages < ActiveRecord::Migration
  def self.up
    create_table :static_pages do |t|
      t.references :author
      t.string :title
      t.text :content
      t.string :url_match

      t.timestamps
    end
    
    add_index :static_pages, :url_match, :unique => true
  end

  def self.down
    drop_table :static_pages
  end
end
