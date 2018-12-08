module Factory

  def find_id(id)
    id_field = resource(:id_field)
    data = resource(:db).where(id_field => id).first
  end

  def find_name(name)
    name_field = resource(:name_field)
    data = resource(:db).where(name_field => name).first
  end

  def all
     data = resource(:db).all.map { |data| new(data) }
  end

  def delete_id(id)
    id_field = resource(:id_field)
    resource(:db).where(id_field => id).delete
  end

  def delete_name(name)
    name_field = resource(:name_field)
    resource(:db).where(name_field => name).delete
  end

  def create(object)
    defaults = resource(:defaults)
    id_field = resource(:id_field)
    db = resource(:db)
    id = db.insert(defaults)
    object.data = object.data.merge(id_field => id)
  end

  def newPassword(object)
    if object.data[:password] != nil
      bcPassword = BCrypt::Password.create(object.data[:password])
      print(bcPassword)
      object.data = object.data.reject { |k, _| k == :password }
      object.data = object.data.merge(password:bcPassword)
    end
    db = resource(:db)
    db.insert(object.data)
  end

  def store(object)
    id_field = resource(:id_field)
    db = resource(:db)
    data = object.data.reject { |k, _| k == id_field }
    db.where(id_field => object.id).update(data)
  end

end


module FactoryInstanceMethods
  attr_writer :data
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def id
    @data[self.class.resource(:id_field)]
  end

  def to_json(options)
    @data.to_json(options)
  end

end
