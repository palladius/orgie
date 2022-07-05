  #########
  # $Id: deploy.rb 1288 2010-05-18 14:16:15Z riccardo $
  # Capistrano Recipe for Orgie..

require 'lib/riccardo_common.rb'

set :application, "orgie"
set :repository,  "svn+ssh://riccardo@svn.goliardia.it/var/svn/ricdev/projects/orgie/trunk"

	# copirato da riclife.. vediamo se va..
set :try_sudo, false
set :use_sudo, false

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :apache_conf_path, "/etc/apache2/sites-enabled/"
set :deploy_to, "/var/www/capistrano/#{application}/"

server "riccardo@dev.palladius.eu", :app, :web, :db, :secondary => true
#server "heanet@www.palladius.eu", :app, :web, :db, :secondary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

after  "deploy", :update_changelog
after "deploy", "deploy:cleanup"  # pulizia se no occupa troppo

task :update_changelog do

	f = changelog_file = File.open( "CHANGELOG" , 'a') # append
	f.puts ("\\o/ " * 20)
	f.puts "Cap deploy: #{application} v. $Rev: 1288 $ updated via capistrano"
	f.puts "When:       #{Time.now} "
	f.puts "Who@where:  #{ `whoami` } @ #{Socket.gethostname} "
	f.puts "Servers:    #{ find_servers_for_task(current_task).join(', ') }"
	f.puts `svn log -r BASE`
end

 namespace :deploy do

   task "apache" do
     create_apache_config
   end

   task :start do
   end
   task :stop do
     
   end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

 def deb(s)
   #puts "#DEB #{gray s}"
   #_debug(s)
 end
 
def create_apache_config # (host_name,appname)
  servers = find_servers_for_task(current_task)
  deb ("Servers: '#{servers.join "', '"}'" )
  for srv in servers do
    user = srv.user
    hostname = srv.host
    deb "Running on server #{srv}: #{user} // #{hostname} // #{srv.class} // #{srv.user} "
    put( # http://www.capify.org/index.php/Put#Examples
      get_capistrano_apache_conffile(application, hostname ),
      "#{apache_conf_path }/capistrano-#{application}-#{hostname}-80.conf",
      :hosts => srv
    )
  end
  deb "Everything's ok on Apache"
  run "apache2ctl configtest && #{sudo} /etc/init.d/apache2 restart" # its the only SUDO devalera is allowed to do ... :(
  puts green("Restarted apache remotely, apparently (today I like adverbs)")
end





  def get_capistrano_apache_conffile(app_name,server_name="_SERVERNAME_TO_BE_DECIDED_YET_"  )
    apache_generation_version     = "1.3b"
    apache_generation_description = "Production and development without pubcookie"
    deploy_dir = "/var/www/capistrano/#{app_name}/current/public"
    deb( "Configuring apache for app '#{app_name}' on '#{server_name}'")
    return <<-CAPISTRANO_CONFFILE_END

  ########################################################################################################
  # $Id: deploy.rb 1288 2010-05-18 14:16:15Z riccardo $
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

