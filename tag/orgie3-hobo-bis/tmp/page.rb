
=begin
  Aggiunta come base per pagine / contenuti...
  Cacnellanda...
=end

class Page < ActiveRecord::Base
  # script/generate scaffold page title:string abstract:text body:text user_id:integer active:boolean

  fields do
      # script/generate scaffold page
    title:string #TBD , :unique
    abstract:text
    body:text
    user_id:integer
    active:boolean

    timestamps
  end

  def name
    title
  end
end
