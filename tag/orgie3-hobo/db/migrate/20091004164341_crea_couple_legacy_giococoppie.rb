class CreaCoupleLegacyGiococoppie < ActiveRecord::Migration
  def self.up
    create_table :giococoppie do |t|
      t.integer  :idUtenteVotante
      t.integer  :idUtenteVotato
      t.boolean  :m_bScoperebbe
      t.boolean  :m_bBacerebbe
      t.datetime :dataVoto
      t.string   :commento
      t.integer  :m_nVoto
      t.string   :sexVotante
      t.boolean  :m_bPrivato
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :giococoppie
  end
end
