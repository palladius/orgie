
=begin
  Tabella da togliere, e far confluire in un qualche tipo di ADO o come si chiama
  con i diritti..
=end

class Administrator < ActiveRecord::Base
  hobo_model

  validates_uniqueness_of :id_utente

  belongs_to :legacy_login , :foreign_key => "id_utente"

  set_table_name 'amministratori'
  set_primary_key "ID_administrator"
  fields do
    id_utente :integer, :unique
    timestamps
  end

  def name
    "TBD LegacyLogin_#{id_utente}"
  end

end
