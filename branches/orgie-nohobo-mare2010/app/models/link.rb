=begin
  Qui l'id NON lho esplicitato vediamo se lo crea lui e o se va meglio...
=end
class Link < ActiveRecord::Base

  #hobo_model # Don't put anything above this

  set_table_name 'linkz'
  set_primary_key "ID_link"

  belongs_to :legacy_login, :foreign_key => 'id_login'

  # fields do
  #   titolo            :string, :unique
  #   id_login          :integer
  #   id_oggettoPuntato :integer
  #   Data_creazione    :datetime
  #   tipo              :string
  #   m_battiva         :boolean
  #   URLlink           :string, :unique
  #   URLlinkFoto       :string
  #   m_bfotoattiva     :boolean
  #   Descrizione       :text
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
