# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091004175349) do

  create_table "amministratori", :primary_key => "ID_administrator", :force => true do |t|
    t.integer  "id_utente"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apparizioni_goliardi_in_foto", :primary_key => "ID_golinfoto", :force => true do |t|
    t.integer  "id_foto"
    t.integer  "id_gol"
    t.string   "note"
    t.datetime "data_commento"
    t.integer  "id_utente_commento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appuntamenti", :primary_key => "ID_appuntamento", :force => true do |t|
    t.integer  "id_utente"
    t.string   "Nome"
    t.string   "tipodiappuntamento"
    t.text     "luogo"
    t.datetime "data_inizio"
    t.datetime "data_fine"
    t.string   "città"
    t.integer  "Abdicabilita"
    t.integer  "recapitogoliarda1"
    t.integer  "recapitogoliarda2"
    t.integer  "recapitogoliarda3"
    t.integer  "id_login"
    t.text     "note"
    t.datetime "data_invio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canzoni", :primary_key => "ID_canzone", :force => true do |t|
    t.string   "titolo"
    t.integer  "id_login"
    t.datetime "Data_creazione"
    t.string   "Autore"
    t.boolean  "m_bSeria",       :default => false
    t.text     "Corpo"
    t.text     "Note"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cariche", :primary_key => "ID_CARICA", :force => true do |t|
    t.integer  "ID_Ordine"
    t.string   "nomecarica"
    t.integer  "ID_CAR_staSottoA"
    t.integer  "CardinalitàMax"
    t.string   "Dignità"
    t.boolean  "Attiva",           :default => true
    t.boolean  "HC",               :default => false
    t.string   "note"
    t.integer  "m_nImportanza"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colorefeluca", :primary_key => "ID_COLOREFELUCA", :force => true do |t|
    t.string   "Facoltà"
    t.string   "colore_default"
    t.string   "città"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contenuti", :primary_key => "idcontenuto", :force => true do |t|
    t.string   "titolo"
    t.integer  "idlogin"
    t.text     "contenuto"
    t.datetime "datacreazione"
    t.integer  "m_nLivelloSegretezza"
    t.boolean  "m_battivo"
    t.boolean  "m_bInAttesa"
    t.string   "tipo"
    t.integer  "idloginpubblicante"
    t.boolean  "m_bSerio"
    t.datetime "datapubblicazione"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventipresenze", :primary_key => "id_presenza", :force => true do |t|
    t.integer  "id_utente"
    t.integer  "id_appuntamento"
    t.integer  "probabilita"
    t.string   "commento"
    t.integer  "m_nquantitotale"
    t.datetime "datacreazione"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facolta", :force => true do |t|
    t.integer  "ID_FACOLTA"
    t.string   "Facolta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foto", :primary_key => "ID_foto", :force => true do |t|
    t.string   "titolo_foto"
    t.string   "descrizione"
    t.string   "percorso"
    t.string   "data_scatto"
    t.integer  "dimensione"
    t.datetime "data_upload"
    t.integer  "id_utente_upload"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gestione_citta", :primary_key => "ID_GEST_CITTA", :force => true do |t|
    t.integer  "id_login"
    t.string   "città"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gestione_ordini", :primary_key => "ID_GEST_ORDINI", :force => true do |t|
    t.integer  "ID_ORDINE"
    t.integer  "ID_LOGIN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "giococoppie", :force => true do |t|
    t.integer  "idUtenteVotante"
    t.integer  "idUtenteVotato"
    t.boolean  "m_bScoperebbe"
    t.boolean  "m_bBacerebbe"
    t.datetime "dataVoto"
    t.string   "commento"
    t.integer  "m_nVoto"
    t.string   "sexVotante"
    t.boolean  "m_bPrivato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gms", :primary_key => "id_gms", :force => true do |t|
    t.datetime "data_invio"
    t.boolean  "m_bNuovo"
    t.integer  "idutentescrivente"
    t.integer  "idutentericevente"
    t.string   "messaggio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goliardi", :primary_key => "ID_GOL", :force => true do |t|
    t.string   "Nome"
    t.string   "Cognome"
    t.datetime "DataProcesso"
    t.string   "Indirizzo"
    t.string   "numcellulare"
    t.string   "Nomegoliardico"
    t.string   "Nomenobiliare"
    t.integer  "ID_Ordine"
    t.integer  "id_login"
    t.datetime "Dataiscrizione"
    t.integer  "BolliAllIscrizione"
    t.string   "email"
    t.integer  "contascazzi"
    t.boolean  "privacy_mail",       :default => false
    t.boolean  "privacy_cell",       :default => false
    t.boolean  "privacy_address",    :default => false
    t.string   "foto"
    t.integer  "ID_FACOLTA"
    t.integer  "m_nPunti"
    t.boolean  "m_bIsMaschio",       :default => true
    t.string   "titolo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linkz", :primary_key => "ID_link", :force => true do |t|
    t.string   "titolo"
    t.integer  "id_login"
    t.integer  "id_oggettoPuntato"
    t.datetime "Data_creazione"
    t.string   "tipo"
    t.boolean  "m_battiva"
    t.string   "URLlink"
    t.string   "URLlinkFoto"
    t.boolean  "m_bfotoattiva"
    t.text     "Descrizione"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loginz", :primary_key => "ID_LOGIN", :force => true do |t|
    t.string   "m_sNome"
    t.string   "m_sPwd"
    t.string   "m_hEmail"
    t.datetime "m_dataIscrizione"
    t.string   "m_thumbnail"
    t.integer  "id_goliarda_default"
    t.boolean  "m_bAdmin",            :default => false
    t.integer  "m_nPX"
    t.integer  "m_nLivello"
    t.boolean  "m_bIsMaschio",        :default => false
    t.boolean  "m_bErreMoscia",       :default => false
    t.boolean  "m_bAttivo",           :default => false
    t.boolean  "m_bGuest",            :default => true
    t.datetime "m_dataLastCollegato"
    t.string   "m_sNote"
    t.datetime "datanascita"
    t.boolean  "m_bIsGoliard",        :default => true
    t.string   "msn"
    t.string   "interessi"
    t.string   "icq"
    t.string   "provincia"
    t.string   "gustisessuali"
    t.boolean  "m_bSerio",            :default => false
    t.boolean  "m_bSingle",           :default => false
    t.boolean  "m_bPunizione",        :default => false
    t.text     "m_snoteadmin"
    t.boolean  "m_bmailpubblica",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messaggi", :id => false, :force => true do |t|
    t.integer  "id_msg"
    t.string   "titolo"
    t.integer  "id_login"
    t.text     "messaggio"
    t.datetime "data_creazione"
    t.boolean  "pubblico",        :default => false
    t.integer  "id_figliodi_msg"
    t.integer  "id_tipo",         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nomine", :primary_key => "ID_NOMINA", :force => true do |t|
    t.integer  "id_goliarda"
    t.integer  "id_carica"
    t.datetime "data_nomina"
    t.datetime "data_fine_nomina"
    t.integer  "id_goliarda_nominante"
    t.string   "note"
    t.integer  "eventuale_numero_progressivo"
    t.integer  "id_utente_postante"
    t.datetime "data_inserimento_nomina"
    t.boolean  "m_bAttiva"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordini", :primary_key => "ID_ORD", :force => true do |t|
    t.string   "Nome_veloce"
    t.string   "Nome_completo"
    t.string   "Sigla"
    t.integer  "ID_ORD_Vassallo_di"
    t.boolean  "Sovrano"
    t.string   "Città"
    t.datetime "datadinascita"
    t.string   "Motto"
    t.string   "m_fileImmagine"
    t.string   "m_fileImmagineTn"
    t.text     "note"
    t.text     "storia"
    t.integer  "id_utente_creatore"
    t.datetime "data_creazione"
    t.boolean  "m_bSerio"
    t.string   "indirizzo"
    t.string   "emailordine"
    t.boolean  "m_bInSonno"
    t.integer  "m_nPrecedenzaCittadina"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "query_notevoli", :primary_key => "ID", :force => true do |t|
    t.string   "titolo"
    t.datetime "data_creazione"
    t.string   "note"
    t.text     "encoded_query"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regioni", :force => true do |t|
    t.string   "nomecitta"
    t.string   "sigla"
    t.string   "regione"
    t.integer  "id_pseudoid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ulteriori_gestioni_goliardiche", :primary_key => "ID", :force => true do |t|
    t.integer  "id_login"
    t.integer  "id_gol"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.integer  "legacy_login_id"
  end

  create_table "xxx_memoz", :force => true do |t|
    t.string   "chiave"
    t.text     "valore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "xxx_meta", :force => true do |t|
    t.string   "nome_tabella"
    t.string   "nome_campo"
    t.string   "tipo_campo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
