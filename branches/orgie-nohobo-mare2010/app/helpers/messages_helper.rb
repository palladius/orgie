module MessagesHelper

  # figoso!
  def linked_title(msg, content='' )
    begin
      return "<table width='100%' border='1'><tr><td>\n" +
        "<p>[#{msg.father? ? 'F' : 'S' }]" + linked_model( msg) + '</p> ' +
        "<small> #{link_to msg.legacy_login}, #{time_ago_in_words(msg.data_creazione)} ago</small>" +
        ( content ? "<p>#{ h(content) }</p> " : 'NO CONTENT' ) +
      "</td></tr></table>\n"
    rescue
      return "Some errors occurred, zorry: #{h $!}"
    end
    #"#{msg.title}"
  end
  

  def title_and_body(m)
    linked_title(m,m.body)
  end
  
  def title_and_abstract(m)
    linked_title(m,m.body[0..30]+" ...")
  end

  def public_column(r)
    r.pubblico ? 'pubblico' : 'privato'
  end

    # mangled body :)
  def visualize_message_body(r)
    r.messaggio.inspect.
#      gsub(/[^a-z0-9 \n\.\!]/i,'_').
      gsub(/\\r|\\000/,'').
      gsub(/\\/,'').
      gsub("\\n","<br/>\n").
      chomp.strip.
      gsub('andata',"<b>AndATa</b>")
  end
  
  def message_photo(msg,opts={})
    opts[:border] ||= 5
    link_to(
      image_tag("people/#{msg.user}.jpg", opts),
      msg.user
      )
  end
  
end
