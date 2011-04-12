class AddPageCategoryToStaticPages < ActiveRecord::Migration
  def self.up
    change_table :static_pages do |t|
      t.references :page_category
    end
  end

  def self.down
    remove_column :static_pages, :page_category_id
  end
end
