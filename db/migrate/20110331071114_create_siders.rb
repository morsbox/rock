class CreateSiders < ActiveRecord::Migration
  def self.up
    create_table :siders do |t|
      t.references :sider_type
      t.string :title, :null => false
      t.string :sider_position, :null => false
      t.text :params_dump
      t.text :restrictions_dump
      t.boolean :enabled, :default=> true

      t.timestamps
    end
    add_index :siders, :sider_position
  end

  def self.down
    drop_table :siders
  end
end
