class XxxMemo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  set_table_name  'xxx_memoz'  # Created with bin/schema_table_to_generator.rb v1.1
  #NO! Proviamo cosi, al max s'incazza che in produzione gli manca l'ID...
  # TODO gestisci sta cosa e vedi se si incazza in prodzuone, immagino di si...
  # set_primary_key 'chiave' # This IS important BEFORE the migration!!!

  fields do
    chiave :string, :unique
    valore :text
    timestamps
  end

	def name
		chiave
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
