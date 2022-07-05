class Role < ActiveRecord::Base

  hobo_model # Don't put anything above this

  set_table_name  'nomine'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_NOMINA' # This IS important BEFORE the migration!!!

  fields do
    id_goliarda                  :integer
    id_carica                    :integer
    data_nomina                  :datetime
    data_fine_nomina             :datetime
    id_goliarda_nominante        :integer
    note                         :string
    eventuale_numero_progressivo :integer
    id_utente_postante           :integer
    data_inserimento_nomina      :datetime
    m_bAttiva                    :boolean
    timestamps
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
