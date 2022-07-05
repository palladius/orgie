=begin
  $Id$
# TODO
TODO  add_index "regioni", ["id_pseudoid"], :name => "id_pseudoid", :unique => true
TODO  add_index "regioni", ["sigla"], :name => "sigla", :unique => true
=end

class City < ActiveRecord::Base
  hobo_model # Don't put anything above this

  set_table_name  "regioni"
    #set_primary_key "LO DIENTICAI onde usai lo pseudo id ma ora ho un id vero.."

  fields do
    nomecitta   :string,   :unique
    sigla       :string  , :unique
    regione     :string
    id_pseudoid :integer , :unique  # obsolendum...
    timestamps
  end

  validates_uniqueness_of  :nomecitta, :sigla, :id_pseudoid

  def name
    nomecitta
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
