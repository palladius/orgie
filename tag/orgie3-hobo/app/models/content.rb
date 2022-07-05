class Content < ActiveRecord::Base

  hobo_model # Don't put anything above this
# In file 'app/models/content.rb':
    set_table_name  'contenuti'  # Created with bin/schema_table_to_generator.rb v1.1
    set_primary_key 'idcontenuto' # This IS important BEFORE the migration!!!

  fields do
    titolo               :string
    idlogin              :integer
    contenuto            :text
    datacreazione        :datetime
    m_nLivelloSegretezza :integer
    m_battivo            :boolean
    m_bInAttesa          :boolean
    tipo                 :string
    idloginpubblicante   :integer
    m_bSerio             :boolean
    datapubblicazione    :datetime
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
