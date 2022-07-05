=begin
  create_table "appuntamenti", :primary_key => "ID_appuntamento", :force => true do |t|
    t.string   "Nome",               :limit => 50
    t.string   "tipodiappuntamento", :limit => 50
    t.text     "luogo",              :limit => 2147483647
    t.datetime "data_inizio"
    t.datetime "data_fine"
    t.string   "città",             :limit => 50
    t.integer  "Abdicabilita"
    t.integer  "recapitogoliarda1"
    t.integer  "recapitogoliarda2"
    t.integer  "recapitogoliarda3"
    t.integer  "id_login"
    t.text     "note",               :limit => 2147483647
    t.datetime "data_invio"
  end
=end
class Event < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  set_table_name 'appuntamenti'
  set_primary_key "ID_appuntamento"
  fields do
    id_utente :integer
    Nome              :string
    tipodiappuntamento :string
    luogo :text
    data_inizio :datetime
    data_fine :datetime
    città :string
    Abdicabilita      :integer
    recapitogoliarda1 :integer
    recapitogoliarda2 :integer
    recapitogoliarda3 :integer
    id_login :integer
    note :text
    data_invio :datetime
    timestamps
  end

  def name
    self.Nome
  end

  def self.description
    "Classe creata in stile hobo ma a MANO non con l'hobo scaffolding, quindi vien fuori invisibile ahime.
  Proviamo a renderla con l'active scaffodling ordunque. Pachate le route ad esempio."
  end
end
