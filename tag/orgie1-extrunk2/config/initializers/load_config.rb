# $Id$
#

# Loads our configuration file. RAILS_ENV is prioritary towards common conf!
# http://media.railscasts.com/videos/085_yaml_config_file.mov
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")['_common_to_all'].merge YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]

SECRET_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/secrets.yml")