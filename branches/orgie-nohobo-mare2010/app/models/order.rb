class Order < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'ordini'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_ORD' # This IS important BEFORE the migration!!!

  belongs_to :city,         :foreign_key => 'Città'
  belongs_to :legacy_login, :foreign_key => 'id_utente_creatore'
 ### validates_associated :city , :legacy_login

  validates_length_of :Sigla,         :in => 3..10, :allow_nil => true
  validates_length_of :Nome_veloce,   :in => 3..20
  validates_length_of :Nome_completo, :minimum => 5, :too_short => "please enter at least {{count}} characters"
  validates_format_of :emailordine, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :ID_ORD, :Nome_veloce, :Nome_completo, :Sigla

  # fields do
  #   Nome_veloce            :string
  #   Nome_completo          :string 
  #   Sigla                  :string
  #   ID_ORD_Vassallo_di     :integer
  #   Sovrano                :boolean, :default => false
  #   Città                  :string
  #   datadinascita          :datetime
  #   Motto                  :string
  #   m_fileImmagine         :string
  #   m_fileImmagineTn       :string
  #   note                   :text
  #   storia                 :text
  #   id_utente_creatore     :integer
  #   data_creazione         :datetime
  #   m_bSerio               :boolean, :default => true
  #   indirizzo              :string
  #   emailordine            :string  # valid email
  #   m_bInSonno             :boolean
  #   m_nPrecedenzaCittadina :integer, :default => 10  # così puoi metter prima e dopo :)
  #   timestamps
  # end

	def name
		self.Nome_completo
	end

  def self.names
    Order.find(:all).map{|x| x.name}
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
