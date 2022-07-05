# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

@debug = false

if @debug
  puts(( "Attention! Im going to destroy every table for test's sake! If this is not what you want, disable debug!"))
  #[ Message,  Content,  XxxMetum,  GmsText, HatColor, Message, Order, XxxMetum]
  (ApplicationHelper::ORGIE_MODELS - ApplicationHelper::SPECIAL_MODELS).each{|model|
    puts "DEB Deleting #{model.count} occurrences of #{model}.."
    model.delete_all
  }
#  Couple.delete_all()
#  XxxMetum.delete_all
end

Song.create( :id => 1, :titolo => 'Fanfulla' )

#User.create( :name => 'root',      :email_address => 'palladius@email.it', :administrator => true )

#User.generate_admin('palladius', true )
root_user = User.create( :name => 'root',  :email_address => 'palladiusbonton@gmail.com') # SHOULD BE AUTO: , :administrator => true )
guest_user = User.create( :name => 'guest', :email_address => 'palladius@email.it') #        SHOULD BE AUTO: , :administrator => false)
ric_user = User.create( :name => 'ricky', :email_address => 'riccardo.carlesso@gmail.com') #        SHOULD BE AUTO: , :administrator => false)
fregna_user = User.create( :name => 'fregna', :email_address => 'test-fregna@gmail.com') #        SHOULD BE AUTO: , :administrator => false)

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
  :id_msg => 1,
  :id_figliodi_msg => 0 ,
  :messaggio => "This id_figliodi_msg is 0, not dflt (I assume null)",
  :id_login => palladius.id
)
(1..10).each{|x|
  Message.create(
    :titolo => "Post about number '#{x}'" ,
    :id_msg => 10 + x,
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
City.create( :nomecitta => 'Arzenta',  :sigla => 'AZ',  :regione => 'Emilia Romagna', :id_pseudoid => 3534 )
City.create( :nomecitta => 'Frara',  :sigla => 'FR',  :regione => 'Emilia Romagna', :id_pseudoid => 3535 )
City.create( :nomecitta => 'Bulaggna',  :sigla => 'BU',  :regione => 'Emilia Romagna', :id_pseudoid => 3536 )

Event.create( :Nome => 'Gran Galà di San patrizio :)' )
Event.create( :Nome => 'Mio Compleanno Domani' ,
  :data_inizio => Time.now+1.day,
  :data_fine => Time.now+2.day,
  :id_login => palladius.id,
  :città => 'Dun Laoghaire'
  )
  
################################################################################
# Links
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

################################################################################
# Goliard
Goliard.create( :Nomegoliardico => 'Palladius', :Nomenobiliare => 'BonTon')
Goliard.create( :Nomegoliardico => 'Venerdì', :Nomenobiliare => 'Calippo')

################################################################################
# Content
Content.create( :titolo => 'TODO Test content',
  :contenuto => 'TODO: ricordati di fare le internazionalizzazioni' ,
  :idloginpubblicante => root_user.id )
Content.create (:titolo => 'Lorem Ipsum',
  :contenuto => ApplicationHelper.lorem_ipsum(),
  :idloginpubblicante => palladius.id)

################################################################################
# Faculty
Faculty.create( :Facolta => 'IngeGNeria')
Faculty.create( :Facolta => 'DAMS')
Faculty.create( :Facolta => 'Scienze della Formazione' )

GmsText.create(
  :idutentescrivente => fregna_user.id,
  :idutentericevente => ric_user.id,
  :messaggio => 'Ric sei molto fico sai??' )
GmsText.create(
  :idutentescrivente => ric_user.id,
  :idutentericevente => fregna_user.id,
  :messaggio => 'Anche tu sei fregna sai??' )
GmsText.create(
  :idutentescrivente => ric_user.id,
  :idutentericevente => fregna_user.id,
  :messaggio => "Questo dovrebbe fallire perche c'e' già una coppia per (Ric,Fregna)" )

################################################################################
# Coppie gioco delle coppie
Couple.create(
  :idUtenteVotante => ric_user.id,
  :idUtenteVotato  => fregna_user.id,
  :commento => "Ma quanto mi ti farei...",
  :m_bScoperebbe => true,
  :m_bBacerebbe  => true,
  :m_nVoto => 10 )
Couple.create(
  :idUtenteVotante => fregna_user.id,
  :idUtenteVotato  => ric_user.id,
  :commento => "Io invece no",
  :m_nVoto => 1 )
Couple.create(
  :idUtenteVotante => fregna_user.id,
  :idUtenteVotato  => root_user.id,
  :commento => "TEST voto illegale",
  :m_nVoto => 11 )


# ColoreFeluca
=begin
	Modifica 	Elimina 	20 	Scemenze politiche 	bluone 	Bologna
=end
HatColor.crea('Architettura','nero')
HatColor.crea('Ingegneria','nero')
HatColor.crea('Chimica Industriale','nero')
HatColor.crea('Belle arti','zucchero')
HatColor.crea('Matematica')
HatColor.crea('Informatica')
HatColor.crea('Fisica')
HatColor.crea('CTF')
HatColor.crea('Biotecnologia')
HatColor.crea('Biologia','giallo')
HatColor.crea('Economia','giallo')
HatColor.crea('Giurisprudenza','blu')
HatColor.crea('Storia','bianco')
HatColor.crea('Scienze della comunicazione','bianco')
HatColor.crea('Pedagogia','bianco')
HatColor.crea('Magistero','bianco')
HatColor.crea('Filosofia','bianco')
HatColor.crea('Lettere','bianco')
HatColor.crea('Lingue','amaranto')
HatColor.crea('Interprete e Traduttore','amaranto')
HatColor.crea('Altro...','marrone')
HatColor.crea('Medicina','rosso')
HatColor.crea('Farmacia','rosso')
HatColor.crea('Veterinaria','rosso')
HatColor.crea('Economia','dovrebbe FALLIRE QWERTY')
HatColor.crea('Scemenze politiche','bluone')
HatColor.crea('Economia','grigio','Torino')
@fittone = Order.create(
  :Nome_veloce            => 'Fittone',
  :Nome_completo          => 'Sacer VenerabilisQue Fictonis Ordo',
  :Sigla                  => "SVQFO",
  :ID_ORD_Vassallo_di     => -1, # equivale a null
  :Sovrano                => true,
  :Città                  => 'Bologna',
  :Motto                  => 'Aeterno Duro',
  :m_fileImmagine         => 'bo_blason.gif',
  :m_fileImmagineTn       => '_fitton.gif',
  :emailordine            => 'fittone@gmail.com'

)
@montecristo = Order.create(
  :Nome_completo          => 'Goliardica Balla di Montecristo',
  :Nome_veloce            => 'Montecristo',
  :Sigla                  => "GBM",
#  :ID_ORD_Vassallo_di     =>  @fittone.id,
  :Sovrano                =>  false,
  :Città                  => 'Bologna',
  :Motto                  => 'Pauci sed boni',
  :m_fileImmagine         => 'montecristo.jpg',
  :m_fileImmagineTn       => 'bo-monte.gif',
  :emailordine            => 'montecristo@gmail.com'
)
@illegal_shouldnt_work = Order.create( :Sigla       => "ILLEGAL qwerty" )
