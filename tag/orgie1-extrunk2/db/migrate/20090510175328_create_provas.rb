class CreateProvas < ActiveRecord::Migration
  def self.up
    create_table :provas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :provas
  end
end
