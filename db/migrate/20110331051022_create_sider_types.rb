class CreateSiderTypes < ActiveRecord::Migration
  def self.up
    create_table :sider_types do |t|
      t.string :helper_name, :null => false
      t.text :default_params_dump
      t.boolean :enabled, :default=> true

      t.timestamps
    end
    add_index :sider_types, :helper_name, :unique => true
  end

  def self.down
    drop_table :sider_types
  end
end
