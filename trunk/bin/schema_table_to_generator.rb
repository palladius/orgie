#!/usr/bin/env ruby
# $Id$

=begin
# Questo file geniale, se funziona, prende una tabella dallo schema e GENERA una hobo migration o whatever...

FROM:

 create_table "cariche", :primary_key => "ID_CARICA", :force => true do |t|
    t.integer "ID_Ordine"
    t.string  "nomecarica",       :limit => 50
    t.integer "ID_CAR_staSottoA"
    t.integer "CardinalitàMax"
    t.string  "Dignità",         :limit => 50
    t.boolean "Attiva",                          :default => false, :null => false
    t.boolean "HC",                              :default => false, :null => false
    t.string  "note",             :limit => 150
    t.integer "m_nImportanza",                   :default => 0,     :null => false
  end

TO:
script/generate hobo_model_resource  -p --svn TABLENAME \
  titolo:string id_login:integer \
  messaggio:text data_creazione:datetime
...

=end

@version = '1.1'
@dflt_conffile = 'db/schema.rb.legacy'


def debug(s)
  #puts "#DEB #{s}"
  puts "#D \033[1;30m#{s}\033[0m"

end

def usage(conffile=@dflt_conffile)
  puts "#{$0} v.#{@version } # $Id$ "
  puts "Usage: #{$0} <old_tablename> <newModelName SINGULAR> [conffile] # dflts to #{conffile}"
  puts ''
end

# parses a schema.rb file looking for a old_tablename, then produces some output
def parse_config_file(conffile, old_tablename, newModelName  )
  ret = "# HOBO GENRATOR: \nruby script/generate hobo_model_resource --svn #{newModelName}"
  final_suggestions = "\n# Run without -p when it works :)
  # Remember to add this two lines afterwards: \n
  # In file 'app/models/#{newModelName}.rb':
    set_table_name  '#{old_tablename}'  # Created with #{$0} v#{@version}
  "
  ix_first = nil
  ix_last = nil
  linenumber = 0
  f = File.open(conffile, 'r')
  return "# nil" if f.nil?

  f.readlines.each{|line|
    line.chomp!
    linenumber += 1
    unless line.match("  create_table \"#{old_tablename}\"") || (ix_first)
      next
    end
    if ix_first.nil?
      ix_first ||= linenumber
      debug "# #{linenumber} Begin found!!!  Line n.#{ix_first}"
      debug "# DEB: line='#{line}' "
      debug "BEWARE to put the foreign key MANUALLY into the model (and maybe into the migration itself) before running the migration!!!"
        #  create_table "cariche", :primary_key => "ID_CARICA", :force => true do |t|
      if line.match(":primary_key")
        pk=line.split(':primary_key => ')[1].split(',')[0].split('"')[1]
        final_suggestions += "  set_primary_key '#{pk}' # This IS important BEFORE the migration!!! "
      end
    end

     #  t.integer "m_nImportanza"   ==> m_nImportanza.integer
    if line =~ /  t\..*$/
      debug "middle line='#{line}'"
      type=line.split[0].split('.')[1]
      fieldname = line.split[1].split('"')[1]
      ret += " #{fieldname}:#{type} "
      next
    end
    
    if line == ("  end")
      ix_last = linenumber
      debug "##{linenumber} End found!!!  #{ix_first} - #{ix_last}"
      return ret + final_suggestions  # end
      #continue
    end

   
  }
  
  return ret
end



def main()
  conffile = 'db/schema.rb.legacy'
  if ARGV.size < 2
    usage conffile
    exit 1
  end

  old_tablename = ARGV[0] || 'colorefeluca'
  newModelName = ARGV[1] || 'position'
  if newModelName[-1..-1] == 's' # string ends with 's' --> roughly is_plural :)
    usage conffile
    exit 1
  end
  debug "ARGV: #{ARGV}"
  debug "$0 v.$VER "
  debug "ConfFile: #{conffile} ; tablename: #{old_tablename} ==> #{newModelName}"
  puts parse_config_file(conffile, old_tablename, newModelName  )
end

main