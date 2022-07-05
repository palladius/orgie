class Order < ActiveRecord::Base

  hobo_model # Don't put anything above this

  set_table_name  'ordini'  # Created with bin/schema_table_to_generator.rb v1.1
  set_primary_key 'ID_ORD' # This IS important BEFORE the migration!!!

  fields do
    Nome_veloce            :string
    Nome_completo          :string
    Sigla                  :string
    ID_ORD_Vassallo_di     :integer
    Sovrano                :boolean
    Città                 :string
    datadinascita          :datetime
    Motto                  :string
    m_fileImmagine         :string
    m_fileImmagineTn       :string
    note                   :text
    storia                 :text
    id_utente_creatore     :integer
    data_creazione         :datetime
    m_bSerio               :boolean
    indirizzo              :string
    emailordine            :string
    m_bInSonno             :boolean
    m_nPrecedenzaCittadina :integer
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
