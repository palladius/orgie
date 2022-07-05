class CreatiXxxmemozEUlteriorigestionegoliardiche < ActiveRecord::Migration
  def self.up
    create_table :xxx_memoz do |t|
      t.string   :chiave
      t.text     :valore
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :ulteriori_gestioni_goliardiche, :primary_key => :ID do |t|
      t.integer  :id_login
      t.integer  :id_gol
      t.string   :note
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :xxx_memoz
    drop_table :ulteriori_gestioni_goliardiche
  end
end
