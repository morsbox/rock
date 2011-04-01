class CreateSiderTypes < ActiveRecord::Migration
  def self.up
    create_table :sider_types do |t|
      t.string :sider_helper_module, :null => false
      t.boolean :enabled, :default=> true

      t.timestamps
    end
    add_index :sider_types, :sider_helper_module, :unique => true
  end

  def self.down
    drop_table :sider_types
  end
end
