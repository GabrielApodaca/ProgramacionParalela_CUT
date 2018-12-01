require 'ant'
require 'ant/dry/resource_injector'
require 'bcrypt'

require_relative 'controllers/users'
require_relative 'controllers/sites'
require_relative 'controllers/passwords'

require_relative 'Services'

def configure_api!
  Services.load_config
  db = Services.database
  Users.register(:db, db[:users])
  Sites.register(:db, db[:sites])
  Passwords.register(:db, db[:passwords])
end
