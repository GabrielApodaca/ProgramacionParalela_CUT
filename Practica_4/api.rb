require 'ant'
require 'ant/server/grape'
require 'ant/dry/resource_injector'
require 'cute_logger'
require 'grape'
require 'puma'
require 'bcrypt'

require_relative 'controllers/users'
require_relative 'controllers/sites'
require_relative 'controllers/passwords'

require_relative 'Services'

require_relative 'routes/Users'
require_relative 'routes/Sites'
require_relative 'routes/Auth'

require 'httparty'

def configure_api!
  Services.load_config
  db = Services.database
  Users.register(:db, db[:users])
  Sites.register(:db, db[:sites])
  Passwords.register(:db, db[:passwords])
end


class UApi < Grape::API
  include Ant::Server::GrapeDecorator
  version('v1', using: :header, vendor: :cutonala)
  prefix(:api)
  format(:json)

  mount Routes::User
  mount Routes::Site
  mount Routes::Auth
end
