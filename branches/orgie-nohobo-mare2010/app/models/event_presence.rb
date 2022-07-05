class EventPresence < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'eventipresenze'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'id_presenza' # This IS important BEFORE the migration!!!

  fields do
    id_utente       :integer
    id_appuntamento :integer
    probabilita     :integer
    commento        :string
    m_nquantitotale :integer
    datacreazione   :datetime
    timestamps
  end

	def name 
		commento
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
