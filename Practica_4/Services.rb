require 'sequel'
require 'safe_yaml'

module Services

  def self.load_config
    SafeYAML::OPTIONS[:default_mode] = :safe
    @config = SafeYAML.load_file('.\config.yaml')
  end

  def self.database
    @database ||= Sequel.connect(@config['database']['endpoint'])
  end
end
