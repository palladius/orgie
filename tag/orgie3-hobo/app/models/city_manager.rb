class CityManager < ActiveRecord::Base

  hobo_model # Don't put anything above this

   # In file 'app/models/city_manager.rb':
    set_table_name  'gestione_citta'  # Created with bin/schema_table_to_generator.rb v1.1
    set_primary_key 'ID_GEST_CITTA' # This IS important BEFORE the migration!!!
    
  fields do
    id_login :integer
    città   :string
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
