class CreaLegacyloginzDaLoginz < ActiveRecord::Migration
  def self.up
    create_table :loginz, :primary_key => :ID_LOGIN do |t|
      t.string   :m_sNome
      t.string   :m_sPwd
      t.string   :m_hEmail
      t.datetime :m_dataIscrizione
      t.string   :m_thumbnail
      t.integer  :id_goliarda_default
      t.boolean  :m_bAdmin, :default => false
      t.integer  :m_nPX
      t.integer  :m_nLivello
      t.boolean  :m_bIsMaschio, :default => false
      t.boolean  :m_bErreMoscia, :default => false
      t.boolean  :m_bAttivo, :default => false
      t.boolean  :m_bGuest, :default => true
      t.datetime :m_dataLastCollegato
      t.string   :m_sNote
      t.datetime :datanascita
      t.boolean  :m_bIsGoliard, :default => true
      t.string   :msn
      t.string   :interessi
      t.string   :icq
      t.string   :provincia
      t.string   :gustisessuali
      t.boolean  :m_bSerio, :default => false
      t.boolean  :m_bSingle, :default => false
      t.boolean  :m_bPunizione, :default => false
      t.text     :m_snoteadmin
      t.boolean  :m_bmailpubblica, :default => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :loginz
  end
end
