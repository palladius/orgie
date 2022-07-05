# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  ORGIE_MODELS = [ Bugmessage, City, Content, Couple,
    Event, Faculty, GmsText, Goliard, HatColor, LegacyLogin, Link,
    Message, Order, Picture, Position, Role,
    Song, SqlQuery, User, XxxMetum, XxxMemo ]
  SPECIAL_MODELS = [ User, UserMailer, LegacyLogin ]

  def yellow(s='Test string to test my favorite color: YELLOW color')
     "\033[1;33m#{s}\033[0m"
  end

  def giallo(s)
    yellow s
  end

  def pyellow(s)
    puts yellow(s)
  end
  
  def linked_model(obj)
    link_to(
      image_tag("icons/models/#{obj.class}.png", :height => 15 , :border => 0 , :alt => "Link for #{obj.class} n. #{obj.id}") + obj.to_s ,
      obj
    )
  end

  def ok(bool=true,msg='')
    bool ?  
      "<font color='green'>OKI(#{msg})</font>\n" :
      "<font color='red'>ERR(#{msg})</font>\n"
  end

  ALL_MODELS = [Administrator ] + ORGIE_MODELS
 
  def self.lorem_ipsum(max_length=200)
    LOREM[0..max_length]
  end
  def fancy_box(content)
    "<table class='fancy' border='1'><tr><td>\n"+
      content +
    "</td></tr></table>\n"
  end
   LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet risus mauris. Sed ut enim non libero volutpat malesuada sit amet sit amet eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus blandit congue arcu, quis consequat sapien ornare ac. Praesent cursus odio vel tellus pharetra eleifend. Phasellus dui enim, varius a luctus in, ultricies ac magna. Suspendisse bibendum dui molestie orci egestas sit amet imperdiet nisl tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent vulputate sodales nisi id bibendum. Proin id nibh id ante bibendum blandit eget ac metus. Nulla ultrices luctus arcu ut congue. Vivamus blandit lobortis tellus eu mollis. Integer dapibus est vitae odio interdum eu mollis felis vulputate. Vestibulum accumsan elit quis nibh eleifend laoreet. Aenean pretium euismod purus ut aliquet. Vestibulum ac risus in diam pharetra ultrices. Morbi faucibus felis quis orci congue nec luctus mi sollicitudin.
Vivamus consectetur, nulla et commodo faucibus, ante quam commodo velit, in imperdiet odio lacus sit amet ligula. Vestibulum interdum, augue vitae tristique scelerisque, risus ante luctus lorem, ut laoreet elit felis non lorem. Pellentesque et nisi augue. Praesent ac felis lorem, ut interdum metus. Nunc eleifend rhoncus nulla sed tempus. Duis ac justo eget justo convallis accumsan quis ut nunc. Cras id arcu nisl, lobortis aliquet sem. Ut viverra suscipit aliquam. Nulla suscipit, augue in blandit rutrum, neque tellus ullamcorper diam, et facilisis erat metus at ante. Donec tincidunt dictum accumsan. Proin egestas imperdiet urna cursus blandit. Sed ac felis eu turpis blandit vehicula sed non lacus. Sed vel congue dui. Vivamus volutpat, purus nec luctus venenatis, lorem mauris molestie turpis, ut elementum tellus arcu at lorem.
Maecenas at lectus non diam tincidunt dapibus. Sed pellentesque pharetra neque et molestie. Proin et ullamcorper neque. Integer pretium accumsan mauris quis posuere. Curabitur consectetur imperdiet arcu eget posuere. Aliquam bibendum aliquam ipsum, vitae vulputate justo faucibus nec. Cras placerat suscipit semper. Aenean augue enim, bibendum eget vulputate et, feugiat in nunc. Nam viverra sagittis ligula, eget dapibus sapien volutpat quis. Fusce nunc ligula, luctus porta aliquet in, suscipit ac sem. In hac habitasse platea dictumst.
Maecenas at mollis ligula. Nullam rutrum adipiscing dui, quis egestas enim semper non. Nulla nec massa dui, id tempus nibh. Pellentesque non nisi mi. Nulla at mi diam. Aliquam fringilla ipsum id enim tincidunt pharetra. Curabitur ac mauris vitae mi tincidunt porttitor. Aliquam pulvinar semper dui, a fermentum ipsum sagittis ullamcorper. Fusce quis neque et elit pharetra pulvinar nec eu sem. Aenean neque sapien, tincidunt interdum mattis vitae, tincidunt sed tortor. In lacus ipsum, semper et dignissim at, adipiscing at mauris. Cras condimentum tristique pharetra. Sed sed felis orci, nec viverra nisl. Nam dictum velit sed urna commodo malesuada. Ut mollis leo purus. Maecenas dictum viverra eros eu euismod. Nullam convallis adipiscing ligula, eu lacinia magna luctus non. Ut euismod gravida rutrum. Sed sapien sem, ultrices vel rutrum ut, ultricies non ligula. Aenean elit felis, pretium sit amet convallis at, gravida quis eros.
Morbi euismod, urna sed porta iaculis, risus odio tincidunt odio, et laoreet enim enim vitae turpis. Nam ac tincidunt tellus. Donec vel libero ut leo sodales sagittis vitae eget felis. Phasellus varius ullamcorper nunc in tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In hac habitasse platea dictumst. Quisque eu dolor quis urna ultrices consequat. Proin dapibus luctus eros, a rhoncus eros vehicula vitae. Nullam id ante velit. Maecenas a condimentum leo.
Fusce nibh lorem, pharetra a condimentum ac, imperdiet eu magna. Curabitur euismod nunc nec purus dictum eget adipiscing nunc ullamcorper. Nulla suscipit massa sit amet nulla pulvinar non hendrerit nibh scelerisque. Donec suscipit accumsan eros, ut facilisis nisl pulvinar vitae. Donec scelerisque venenatis turpis, non dapibus nulla condimentum vitae. Curabitur in sapien velit. Ut eu quam elit, vitae posuere dolor. Fusce placerat, tellus a mattis fringilla, libero ligula dignissim urna, in accumsan metus purus eget ante. Aliquam a odio magna, vestibulum luctus purus. Aenean nibh ligula, gravida eget pulvinar luctus, ornare sed est. Suspendisse dictum rutrum massa, at lacinia turpis semper quis. Morbi elementum elit et diam iaculis nec pellentesque justo sollicitudin. Phasellus scelerisque lacus ut sem blandit ullamcorper. Quisque magna elit, tempor vel tempor id, cursus vitae mi. Cras semper vulputate nulla eu faucibus.
Nunc ut velit condimentum velit blandit volutpat. Quisque hendrerit vestibulum lectus molestie tincidunt. Mauris viverra lacus eget lacus consequat rutrum. Praesent sit amet diam ante, ut porta purus. Sed nibh tortor, posuere ut semper ac, tincidunt sit amet massa. Sed rhoncus rhoncus nulla id congue. Vestibulum vehicula aliquet augue, sit amet luctus diam egestas non. Sed quis diam a urna egestas lobortis. In ut libero nulla, non interdum mi. Phasellus convallis ornare urna ut laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam ut ligula risus, ut posuere magna. Duis felis erat, tincidunt at malesuada auctor, pellentesque eu nisi. Nam vitae varius quam. Quisque condimentum scelerisque dui at aliquam.
Duis cursus venenatis est eu feugiat. Aliquam ac turpis est, sit amet egestas lacus. Maecenas sagittis justo sit amet urna tempor sed accumsan enim eleifend. Vivamus diam erat, condimentum lacinia euismod in, varius viverra metus. Sed ac est vitae enim faucibus iaculis. Mauris scelerisque ultricies tortor id iaculis. Praesent eu tellus a nisl aliquam euismod quis ut urna. Etiam nibh sem, tristique in malesuada sed, rhoncus porttitor nisl. Nunc sit amet pellentesque urna. Sed commodo posuere urna tincidunt hendrerit. Vivamus sit amet turpis vestibulum magna ultricies consequat ut ac justo. Donec a consequat lorem.
Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vitae orci a dolor iaculis mollis. Sed a metus eget eros feugiat tristique sed quis massa. Nunc ut felis nunc. Vivamus est turpis, suscipit vel cursus quis, ornare eu erat. Donec pharetra odio quis eros sagittis cursus. Aliquam nec massa ut elit vulputate tempor. Mauris condimentum ultricies mi nec lobortis. In hac habitasse platea dictumst. Sed lacinia, mauris non pulvinar congue, diam dui sodales neque, in lacinia dolor neque et enim. Nullam fringilla blandit justo sed commodo. Maecenas feugiat nibh sit amet velit tincidunt sit amet interdum dolor venenatis.
In adipiscing massa eu mi porta vel dictum mauris fermentum. Donec sit amet diam erat. Phasellus ipsum est, aliquam sit amet gravida at, vulputate aliquet quam. Praesent risus elit, convallis in ultrices eu, molestie sed eros. Proin semper enim non nulla gravida et viverra lacus blandit. Maecenas ullamcorper laoreet dictum. Praesent commodo ligula ac tellus tristique mollis. Fusce tempus tortor vel massa vehicula tincidunt. Integer convallis nibh at leo rutrum non commodo sapien consectetur. Fusce tempor velit vel mi molestie a mattis nibh luctus. Curabitur sed lectus eu massa laoreet malesuada eu et metus. Donec semper sagittis arcu, vel fermentum erat cursus et.
Donec nulla nulla, mattis vel tempus eget, vehicula ut diam. Duis in mauris vel ante venenatis gravida. Ut id odio nec elit lacinia lacinia vitae eleifend libero. Sed placerat justo a dolor fringilla adipiscing sed et augue. Nunc metus enim, aliquet quis scelerisque sit amet, condimentum ac sapien. Phasellus adipiscing sapien et augue adipiscing imperdiet. Donec consectetur iaculis nunc convallis viverra. Aenean sollicitudin rutrum ipsum, eget sodales felis commodo ac. Praesent sit amet dapibus libero. Sed at mauris vel turpis pulvinar dapibus et vitae lorem. Proin dictum dapibus orci, quis molestie lorem consectetur et. Curabitur sollicitudin lacinia sapien, ac posuere velit imperdiet ut. Mauris malesuada ultrices massa rutrum lacinia. Fusce vitae sollicitudin tellus. Pellentesque sodales scelerisque tellus id dapibus. Proin sodales porttitor est ut adipiscing. Nunc ullamcorper accumsan venenatis. Praesent pretium condimentum nibh, sed aliquet nisi pulvinar blandit.
Aenean purus ante, auctor sed pulvinar sed, lacinia a orci. Praesent magna lectus, porttitor ut rutrum sed, dignissim nec mauris. Donec at sapien in nulla rutrum dapibus laoreet vel dui. Maecenas tempor justo a diam interdum euismod. Vestibulum id nibh mi. Etiam sit amet velit purus, ut adipiscing nunc. Donec molestie magna vitae lorem luctus sit amet elementum purus bibendum. Integer in augue risus. Phasellus aliquet aliquet ullamcorper. Nullam id erat at est vulputate dictum. Aenean malesuada porta purus quis dapibus. Vivamus auctor diam massa, ac lacinia massa. Morbi vitae quam justo, in egestas quam. Mauris eleifend viverra tellus at iaculis. Aenean vestibulum hendrerit tristique. Maecenas viverra mollis leo, at convallis sem volutpat eget.
Donec vitae pulvinar diam. Vestibulum nunc est, tincidunt eu posuere eu, tempus ut elit. Curabitur in volutpat dolor. Mauris non aliquet metus. Nulla vehicula nulla ut est congue vel accumsan mi semper. Pellentesque nisl quam, gravida sit amet scelerisque aliquam, consectetur at nibh. Nulla blandit mauris quis enim vestibulum et mattis quam posuere. Vestibulum lobortis auctor est, ac sodales ipsum ullamcorper id. In scelerisque ante et tellus eleifend sollicitudin. Donec adipiscing risus et est semper aliquet. Phasellus nulla libero, volutpat a venenatis vel, vulputate non sem. Vestibulum venenatis dui sit amet ante blandit sit amet venenatis erat molestie. Nullam sit amet nisi eros. Vivamus ultricies vulputate aliquam. Donec placerat posuere iaculis. Morbi interdum mattis congue. Mauris egestas libero vel lorem aliquet aliquet. Fusce accumsan, augue vitae scelerisque sollicitudin, leo eros lobortis nisi, sit amet aliquam ipsum elit in neque.
Suspendisse pretium rutrum diam, eu elementum ipsum tempor a. Sed vel orci arcu, sed convallis est. Aenean interdum, leo sit amet viverra sollicitudin, felis risus volutpat sapien, ut dignissim neque metus in mi. Praesent libero erat, gravida vel scelerisque nec, gravida in mauris. Sed at leo in felis venenatis posuere. Praesent vitae tortor eu libero adipiscing vestibulum quis nec diam. Donec sit amet molestie est. Proin sit amet libero ac dolor viverra sollicitudin. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In eu quam ut lectus mattis auctor sed nec metus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed a lectus id ipsum lobortis laoreet. Etiam nec adipiscing tellus. Proin in quam turpis, in commodo enim. Curabitur sit amet justo est. Pellentesque sed lorem velit, at mollis nisl. Quisque in sem nunc. Sed pretium ante eget metus egestas pretium. Sed porta congue mollis.
Nulla egestas vestibulum felis vel facilisis. Vestibulum felis ligula, vestibulum sed commodo sed, tincidunt quis elit. Donec fringilla quam nec ligula euismod scelerisque. Cras nec nisi metus, scelerisque iaculis urna. Nam egestas semper sagittis. Aliquam consectetur leo quis erat interdum in convallis mauris blandit. In pellentesque sapien quis orci faucibus iaculis. Phasellus adipiscing magna at velit ultricies aliquet. Morbi eu blandit enim. Nulla non tortor sed quam venenatis feugiat. Proin sollicitudin, mauris id cursus venenatis, justo diam tempor arcu, non posuere sem nulla ac leo. Sed tempor, leo sit amet dapibus lacinia, justo velit molestie nisi, sit amet imperdiet est velit vel nisi. Mauris sapien lorem, sagittis sit amet iaculis eget, cursus nec felis. Aliquam erat volutpat. "


  def self.lorem_ipsum(max_length=200)
    LOREM[0..max_length]
  end
  
  def logo(height=80)
    return image_tag("logos/logo-goliardia-#{ENV['RAILS_ENV'] rescue 'test' }.png", :height => height )
    return <<-LOGOIMAGE
    	<img src='images/logos/logo-goliardia-#{ENV['RAILS_ENV'] rescue 'test' }.png' width='#{width}' />
    	LOGOIMAGE
  end
  
end
