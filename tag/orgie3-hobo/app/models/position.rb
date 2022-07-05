=begin
  $Id$
=end

class Position < ActiveRecord::Base

  hobo_model # Don't put anything above this

  set_table_name  'cariche'
  set_primary_key 'ID_CARICA' # This IS important BEFORE the migration!!

  fields do
    ID_Ordine        :integer
    nomecarica       :string
    ID_CAR_staSottoA :integer
    CardinalitàMax   :integer
    Dignità          :string
    Attiva           :boolean, :default => true
    HC               :boolean, :default => false
    note             :string
    m_nImportanza    :integer
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
