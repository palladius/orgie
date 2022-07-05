class Couple < ActiveRecord::Base

  implemented_double_key_constraint = false

  #hobo_model # Don't put anything above this

     # TODO questo funge da dio, non so se metterlo in una migrazione o strafottermene e implementarlo
   # da rails, ma se il DB lo supporta... why not??? Vedi se sqlite lo supporta!
  #add_index "giococoppie", ["idUtenteVotante", "idUtenteVotato"], :name => "idUtenteVotante", :unique => true

  set_table_name  'giococoppie'  # Created with bin/schema_table_to_generator.rb v1.1

  # TODO metti unico votante+votato

  # fields do
  #   idUtenteVotante :integer
  #   idUtenteVotato  :integer
  #   m_bScoperebbe   :boolean, :default => false
  #   m_bBacerebbe    :boolean, :default => false
  #   dataVoto        :datetime
  #   commento        :string
  #   m_nVoto         :integer  # TBD 1-10
  #   sexVotante      :string
  #   m_bPrivato      :boolean, :default => false
  #   timestamps
  # end

  validates_uniqueness_of :idUtenteVotante, :scope => [:idUtenteVotante, :idUtenteVotato]


  # TODO metti lui+lei magari con cuoricino in mezzo :)
	def name
		commento
    #"(#{LegacyLogin.find(idUtenteVotante)} LOVE #{LegacyLogin.find(idUtenteVotato)})"
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
