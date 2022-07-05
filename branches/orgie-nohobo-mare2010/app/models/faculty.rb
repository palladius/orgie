class Faculty < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'facolta'  # Created with bin/schema_table_to_generator.rb v1.1

  validates_uniqueness_of :Facolta

  # fields do
  #   ID_FACOLTA :integer
  #   Facolta    :string, :unique
  #   timestamps
  # end

	def name
		self.Facolta
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
