class OrderManager < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  set_table_name  'gestione_ordini'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_GEST_ORDINI' # This IS important BEFORE the migration!!!

  fields do
    ID_ORDINE :integer
    ID_LOGIN  :integer
    timestamps
  end

	def name
		id
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
