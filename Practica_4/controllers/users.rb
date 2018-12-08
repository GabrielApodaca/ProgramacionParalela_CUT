require_relative 'factory'

class Users
  extend Factory
  include FactoryInstanceMethods
  extend Ant::DRY::ResourceInjector

  register(:id_field, :user_id)
  register(:name_field, :name)
  register(:defaults,
           name: ' ',
           email: ' ').freeze


end
