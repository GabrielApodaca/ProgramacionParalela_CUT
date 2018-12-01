require_relative 'factory'

class Passwords
  extend Factory
  include FactoryInstanceMethods
  extend Ant::DRY::ResourceInjector

  register(:name_field, :user_name)
  register(:defaults,
           user_name: ' ',
           email: ' ',
           password: ' ',
           site_name: ' ').freeze


end
