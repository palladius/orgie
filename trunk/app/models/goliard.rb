class Goliard < ActiveRecord::Base

  hobo_model # Don't put anything above this

  # :primary_key => "ID_GOL", le privacy FALSE a default, Maschio NOT NULL, titolo dflt=''

  set_table_name  "goliardi"
  set_primary_key 'ID_GOL'

  fields do
    Nome               :string
    Cognome            :string
    DataProcesso       :datetime
    Indirizzo          :string
    numcellulare       :string
    Nomegoliardico     :string
    Nomenobiliare      :string
    ID_Ordine          :integer
    id_login           :integer
    Dataiscrizione     :datetime # che minchia e'???
    BolliAllIscrizione :integer
    email              :string
    contascazzi        :integer
    privacy_mail       :boolean, :default => false
    privacy_cell       :boolean, :default => false
    privacy_address    :boolean, :default => false
    foto               :string
    ID_FACOLTA         :integer
    m_nPunti           :integer
    m_bIsMaschio       :boolean, :default => true
    titolo             :string
    timestamps
  end

  def name
    "#{titolo} #{nomegoliardico} #{nomenobiliare}"
  end

  def nomegoliardico
    self.Nomegoliardico
  end

  def nomenobiliare
    self.Nomenobiliare
  end

  def validate
    # TODO verifica che 'nome 'name' sia unico, sommando nome e cognome, NON SO come fare :)
  end


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
