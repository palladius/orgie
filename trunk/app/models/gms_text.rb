class GmsText < ActiveRecord::Base

  hobo_model # Don't put anything above this

    set_table_name  'gms'  # Created with bin/schema_table_to_generator.rb v1.1
    set_primary_key 'id_gms' # This IS important BEFORE the migration!!!

  fields do
    data_invio        :datetime
    m_bNuovo          :boolean, :default => true
    idutentescrivente :integer
    idutentericevente :integer
    messaggio         :string
    timestamps
  end

	def name
		messaggio
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
