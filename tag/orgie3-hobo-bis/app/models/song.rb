=begin
  qui ID CANZONE lho esplicitato mentre in 
=end

class Song < ActiveRecord::Base

  hobo_model # Don't put anything above this

  validates_uniqueness_of :titolo

  set_table_name 'canzoni'
  set_primary_key "ID_canzone"

  fields do
    titolo         :string
    id_login       :integer
    Data_creazione :datetime
    Autore         :string
    m_bSeria       :boolean, :default => false
    Corpo          :text
    Note           :text
    tipo           :string
    timestamps
  end

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
