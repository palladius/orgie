class CreaAdministratorsLegacyAmministratori < ActiveRecord::Migration
  def self.up
    create_table :amministratori, :primary_key => :ID_administrator do |t|
      t.integer  :id_utente
      t.datetime :created_at
      t.datetime :updated_at
    end
    Administrator.create( :id_utente => 1 )
  end

  def self.down
    drop_table :amministratori
  end
end
