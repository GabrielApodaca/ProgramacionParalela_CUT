require_relative 'factory'

class Sites
  extend Factory
  include FactoryInstanceMethods
  extend Ant::DRY::ResourceInjector

  register(:id_field, :site_id)
  register(:name_field, :name)
  register(:defaults,
           name: ' ').freeze


end
