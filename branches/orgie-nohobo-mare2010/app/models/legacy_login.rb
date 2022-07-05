class LegacyLogin < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name "loginz"
  set_primary_key  "ID_LOGIN"

  #never_show :m_sPwd, :m_snoteadmin
  
  # fields do
  #   m_sNome             :string, :unique
  #   m_sPwd              :string
  #   m_hEmail            :string, :unique
  #   m_dataIscrizione    :datetime
  #   m_thumbnail         :string
  #   id_goliarda_default :integer
  #   m_bAdmin            :boolean, :default => false
  #   m_nPX               :integer
  #   m_nLivello          :integer
  #   m_bIsMaschio        :boolean, :default => false
  #   m_bErreMoscia       :boolean, :default => false
  #   m_bAttivo           :boolean, :default => false
  #   m_bGuest            :boolean,  :default => true
  #   m_dataLastCollegato :datetime
  #   m_sNote             :string
  #   datanascita         :datetime
  #   m_bIsGoliard        :boolean, :default => true
  #   msn                 :string
  #   interessi           :string
  #   icq                 :string
  #   provincia           :string
  #   gustisessuali       :string
  #   m_bSerio            :boolean, :default => false
  #   m_bSingle           :boolean, :default => false
  #   m_bPunizione        :boolean, :default => false
  #   m_snoteadmin        :text
  #   m_bmailpubblica     :boolean, :default => false
  #   timestamps
  # end

  has_one :user
  validates_uniqueness_of :m_sNome, :m_hEmail
    #, :id_goliarda_default se non null...

  named_scope :contains, lambda { |column, text| {:conditions => ["lower(#{column}) LIKE ?", "%#{text.downcase}%"]} }
  # i.e. LegacyLogin.contains( :m_hEmail , 'gmail.com')

  ###############################################################################################

  # delenda cum migrata erunt
  def name 
    m_sNome
  end

  def self.find_by_name(name)
    self.find_by_m_sNome(name)
  end

  def photo(height=50)
    "<img src='immagini/persone/#{name}.jpg' height='#{height}' class='user' />\n"
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
