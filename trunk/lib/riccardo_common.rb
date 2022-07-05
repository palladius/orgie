#requiers: sudo gem install mechanize

  # heanet_common file. Lib rary shared for heanet products...
  @debug = true

  def yellow(s)
    "\033[1;33m#{s}\033[0m"
  end
  
  def white(s)
    "\033[1;37m#{s}\033[0m"
  end

  def green(s)
    "\033[1;32m#{s}\033[0m"
  end
  def red(s)
    "\033[1;31m#{s}\033[0m"
  end
  def azure(s)
    "\033[1;36m#{s}\033[0m"
  end

  def gray(s)
    "\033[1;30m#{s}\033[0m"
  end

  def deb(s)
    puts gray("#DEB# #{s}") if @debug
  end

  def title(s)
    puts(azure("== #{s} =="))
  end

  def get_capistrano_apache_conffile(app_name,server_name="_SERVERNAME_TO_BE_DECIDED_YET_"  )
    apache_generation_version     = "1.3b"
    apache_generation_description = "Production and development without pubcookie"
    deploy_dir = "/var/www/capistrano/#{app_name}/current/public"
    deb( "Configuring apache for app '#{app_name}' on '#{server_name}'")
    return <<-CAPISTRANO_CONFFILE_END

  ########################################################################################################
  # $Id$
  # This file was automatically generated from Capistrano for application #{app_name} on #{server_name}
  # PLEASE DO NOT EDIT! IF YOU DO, IT WILL BE REWRITTEN FROM NEXT DEPLOY ACTION FOR THIS APP
  # Ruby on Rails Application: '#{app_name}'
  # Server to be deployed:     '#{server_name}'
  # Hostname from cli:         '#{ `hostname`.chomp }'
  # ApacheGeneration v. #{apache_generation_version}:
  #  ''#{apache_generation_description}''
  ########################################################################################################

  Namevirtualhost #{app_name}.#{server_name}:80


  ########################################################################################################
  # Production
  <VirtualHost #{app_name}.#{server_name}:80>
    ServerName #{app_name}.#{server_name}
    DocumentRoot #{deploy_dir}
  </VirtualHost>

  ########################################################################################################
  # Production, Basically the same
  <VirtualHost #{app_name}-prod.#{server_name}:80>
    ServerName #{app_name}-prod.#{server_name}
    DocumentRoot #{deploy_dir}
  </VirtualHost>

  ########################################################################################################
  # Development
  <VirtualHost #{app_name}-devel.#{server_name}:80>
    ServerName #{app_name}-devel.#{server_name}
    DocumentRoot #{deploy_dir}
    RailsEnv development
    #RailsAllowModRewrite off
    <directory "#{deploy_dir}" >
      Order allow,deny
      Allow from all
    </directory>
  </VirtualHost>

  # DONT EDIT HERE (see up)

CAPISTRANO_CONFFILE_END
  end

 


  # worthless
module HeanetCommon
  def initialize
    puts "HEANET COMMON initialize"
  end
end