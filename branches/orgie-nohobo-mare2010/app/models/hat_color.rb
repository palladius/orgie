class HatColor < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name  'colorefeluca'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_COLOREFELUCA' # This IS important BEFORE the migration!!!

  #TBD Metti unico facolta+citta
  validates_uniqueness_of :Facoltà, :scope => [:Facoltà, :città]


  # fields do
  #   Facoltà         :string
  #   colore_default  :string
  #   città           :string
  #   timestamps
  # end

	def name
		"#{self.Facoltà}:#{colore_default}@#{città}"
	end

  def color
    colore_default
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

  def self.crea(faculty_name, color = 'green', city = 'Bologna')
    HatColor.create( :Facoltà => faculty_name, :colore_default => color , :città => city)
  end

end
