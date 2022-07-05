class SqlQuery < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'query_notevoli'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID' # This IS important BEFORE the migration!!!

  # fields do
  #   titolo         :string
  #   data_creazione :datetime
  #   note           :string
  #   encoded_query  :text
  #   timestamps
  # end

	def name
		titolo
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
