=begin
  Questa classe è ASSOLUTAMENTE INUTILE!!
=end
class XxxMetum < ActiveRecord::Base

  #hobo_model
  # table name : xxx_meta. Sono o non sono un genio?
    set_table_name  "xxx_meta"
    #SAREBBE 
    #set_primary_key "IDLEGACY"
    
  # fields do
  #    nome_tabella :string
  #    nome_campo   :string
  #    tipo_campo   :string
  # 
  #    timestamps
  # end

  def name
    "#{nome_tabella}.#{nome_campo}"
  end
end
