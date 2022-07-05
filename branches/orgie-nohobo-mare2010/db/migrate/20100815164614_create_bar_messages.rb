class CreateBarMessages < ActiveRecord::Migration
  def self.up
    create_table :bar_messages do |t|
      # Come cacchio si fara'?!?
      #t.user_id :integer
      #t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bar_messages
  end
end
