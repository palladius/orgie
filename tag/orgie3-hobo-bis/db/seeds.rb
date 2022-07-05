# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


Song.create( :id => 1, :titolo => 'Fanfulla' )

#User.create( :name => 'root',      :email_address => 'palladius@email.it', :administrator => true )

#User.generate_admin('palladius', true )
User.create( :name => 'root',  :email_address => 'palladiusbonton@gmail.com') # SHOULD BE AUTO: , :administrator => true )
User.create( :name => 'guest', :email_address => 'palladius@email.it') #        SHOULD BE AUTO: , :administrator => false)


XxxMetum.create( :nome_tabella => 'obso..', :nome_campo => '..leto')
XxxMetum.create( :nome_tabella => 'XXX Meta', :nome_campo => 'sono da abolire')

#palladius = LegacyLogin.create( :id => 1, :m_sNome => 'palladius',  :m_sPwd => 'palladius' )
#venerdi = LegacyLogin.create( :m_sNome => 'venerdi',  :m_sPwd => 'venerdi' )
pincopallo = LegacyLogin.create( :m_sNome => 'pincopallo',  :m_sPwd => 'pincopallo' )
%w{ palladiuz venerdi palo vipera pincopallo2 }.each{ |name|
  self.instance_variable_set( # dio quanto amo ruby!
    "@login_#{name}",
    LegacyLogin.create(
      :m_sNome  => name,
      :m_sPwd   => "12#{name}34",
      :m_hEmail => "#{name}@rails.seed.example.com"
    )
  )
}
palladius = @login_palladiuz # pigro, poi se va rinomina tutto :) TBD1
venerdi =   @login_venerdi
palo =      @login_palo

Administrator.create( :id_utente => palladius.id   )
Administrator.create( :id_utente => venerdi.id     )

################################################################################
# Creating some messages with father/son relationship:
# 10 msg padri e un figlio tanto per provare...
msg1 = Message.create(
  :titolo => "I <3 Math and hate null ids ;)",
  :id_figliodi_msg => 0 ,
  :messaggio => "This id_figliodi_msg is 0, not dflt (I assume null)",
  :id_login => palladius.id
)
(1..10).each{|x|
  Message.create(
    :titolo => "Post about number '#{x}'" ,
    :messaggio => "The square of #{x} is #{x*x}",
    :id_login => pincopallo.id ,
    :id_figliodi_msg => msg1.id 
  )
}
Message.create(
  :titolo => "Re: Ehi, il quadrato di sei non è 36!",
  :id_figliodi_msg => Message.find_by_titolo("Post about number '6'").id ,
  :messaggio => "Lets check if the son of a son is legal (multilevel subthreading). I vote NO",
  :id_login => palladius.id
)
Message.create(
  :titolo => ApplicationHelper.lorem_ipsum(25),
  :messaggio => ApplicationHelper.lorem_ipsum(1000),
  :id_login => palladius.id
)

(1..10).each{|x|
  Message.create(
    :titolo => "Re#{x}: Lorem Ipsum" ,
    :messaggio => "I dont quite agree with Lorem Ipsum..",
    :id_login => venerdi.id  )
}


City.create( :nomecitta => 'Ath Cliath',  :sigla => 'DU',  :regione => 'Leinster', :id_pseudoid => 3531 )
City.create( :nomecitta => 'Cork',  :sigla => 'CO',  :regione => 'Munster' , :id_pseudoid => 3532 )
City.create( :nomecitta => 'Galway',  :sigla => 'GA',  :regione => 'Connaght', :id_pseudoid => 3533 )

Event.create( :Nome => 'Gran Galà di San patrizio :)' )
Event.create( :Nome => 'Mio Compleanno Domani' ,
  :data_inizio => Time.now+1.day,
  :data_fine => Time.now+2.day,
  :id_login => palladius.id,
  :città => 'Dun Laoghaire'
  )

Link.create(
  :titolo => 'Sito della GoGliardia',
  :URLlink => 'http://www.goliardia.it',
  :Data_creazione => Time.now,
  :id_login => palladius.id )
Link.create(
  :titolo => 'Sito di EasyMagazine',
  :URLlink => 'http://www.github.com/easymagazine',
  :Data_creazione => Time.now,
  :id_login => venerdi.id )

Goliard.create( :Nomegoliardico => 'Palladius', :Nomenobiliare => 'BonTon')
Goliard.create( :Nomegoliardico => 'Venerdì', :Nomenobiliare => 'Calippo')
