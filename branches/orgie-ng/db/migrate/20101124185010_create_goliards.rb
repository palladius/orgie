class CreateGoliards < ActiveRecord::Migration
  def self.up
    create_table :goliards do |t|
        # Originals from www.goliardia.it
      t.string :name
      t.string :surname
      t.datetime :process_date
      t.string :address
      t.string :mobile
      t.string :goliardic_name
      t.string :noble_name
      t.integer :order_id
      t.integer :user_id
      t.datetime :subscription
      t.integer :subscription_stamps
      t.string :email
      t.integer :scazzi_count
      t.boolean :private_mail,    :default => true
      t.boolean :private_cell,    :default => true
      t.boolean :private_address, :default => true
      t.string  :photo
      t.integer :faculty_id
      t.integer :points
      t.boolean :male
      t.string :title
        # New
      t.boolean :public, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :goliards
  end
end
