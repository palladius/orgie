class PictureAppearance < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'apparizioni_goliardi_in_foto'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_golinfoto' # This IS important BEFORE the migration!!!

  # fields do
  #   id_foto            :integer
  #   id_gol             :integer
  #   note               :string
  #   data_commento      :datetime
  #   id_utente_commento :integer
  #   timestamps
  # end

	def name
		note
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
