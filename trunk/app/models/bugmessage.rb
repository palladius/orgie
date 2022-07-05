class Bugmessage < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  set_primary_key "id_msg"
  set_table_name 'messaggi'

  fields do
    titolo          :string, :size => 255 #, :unique  Proviamo a togliere l'unique che magari si confonde e pensa sia l'id
    id_login        :integer
    messaggio       :text
    data_creazione  :datetime                    # Obsolendum
    pubblico        :boolean, :default => false  # Se visualizzabile senza login..
    id_figliodi_msg :integer, :default => -1     # null è legale ma ho visto che cmq scrive '0' se è padre!
    id_tipo         :integer, :default => 0      # l'avevo fatto per il multi-forum..
    timestamps
  end

  named_scope :public, :conditions => {:pubblico => true }
  named_scope :recent, lambda {|*args| { :conditions => [  'created_at > ?', args.first || 5.day.ago ] }}
  named_scope :fathers, :conditions => { :id_figliodi_msg => 0 }
  named_scope :sons_of, lambda {|*args| { :conditions => [  'id_figliodi_msg = ?', args.first || 0 ] }}

  belongs_to :legacy_login , :foreign_key => "id_login"
  belongs_to :message,       :foreign_key => "id_figliodi_msg"

  validates_associated :legacy_login
  validates_associated :message, :allow_blank => true, :allow_nil => true, :if => :son?
  validates_uniqueness_of :titolo

  def name
    titolo
  end

  def self.names
    Message.find(:all).map{|x| x.name}
  end

  def title
    titolo
  end

  def body
    messaggio
  end

  def father?
    return true if id_figliodi_msg.nil?
    id_figliodi_msg == 0
  end
  
  def son?
    ! father?
    #return true if id_figliodi_msg.nil?
    #id_figliodi_msg > 0
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

  def validate
    if id==0 then
      errors.add( :id, " ID cannot be zero, sorry! Or it would be a legal father for every 'father' message :) Start from 1 instead.." )
    end
  end

end
