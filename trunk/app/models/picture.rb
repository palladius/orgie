class Picture < ActiveRecord::Base

  hobo_model # Don't put anything above this
  set_table_name  'foto'  # Created with bin/schema_table_to_generator.rb v1.1
    set_primary_key 'ID_foto' # This IS important BEFORE the migration!!!

  fields do
    titolo_foto      :string
    descrizione      :string
    percorso         :string
    data_scatto      :string
    dimensione       :integer
    data_upload      :datetime
    id_utente_upload :integer
    timestamps
  end

	def name
		titolo_foto
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
