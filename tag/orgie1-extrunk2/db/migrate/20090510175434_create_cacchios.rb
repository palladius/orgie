class CreateCacchios < ActiveRecord::Migration
  def self.up
    create_table :cacchios do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :cacchios
  end
end
