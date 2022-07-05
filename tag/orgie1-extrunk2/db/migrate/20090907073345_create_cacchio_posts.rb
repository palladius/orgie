class CreateCacchioPosts < ActiveRecord::Migration
  def self.up
    create_table :cacchio_posts do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :cacchio_posts
  end
end
