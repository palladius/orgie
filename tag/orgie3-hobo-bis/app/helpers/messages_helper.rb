module MessagesHelper


  def linked_title(msg, content='' )
    begin
      return "<table width='100%' border='1'><tr><td>\n" +
        "<p>[#{msg.father? ? 'F' : 'S' }]" + link_to( msg.title, msg) + '</p> ' +
        "<small> #{link_to msg.legacy_login}, #{time_ago_in_words(msg.updated_at)} ago</small>" +
        ( content ? "<p>#{ h(content) }</p> " : '' ) +
      "</td></tr></table>\n"
    rescue
      return "Some errors occurred, zorry"
    end
    #"#{msg.title}"
  end

  def title_and_body(m)
    linked_title(m,m.body)
  end
  
  def title_and_abstract(m)
    linked_title(m,m.body[0..30]+" ...")
  end

end
