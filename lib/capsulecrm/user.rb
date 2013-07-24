class CapsuleCRM::User < CapsuleCRM::Base
  attr_accessor :username
  attr_accessor :name
  attr_accessor :currency
  attr_accessor :timezone
  attr_accessor :logged_in
  attr_accessor :party_id

  define_attribute_methods [:username, :name, :currency, :timezone, :logged_in, :party_id]

  # nodoc
  def attributes
    attrs = {}
    arr = [:username, :name, :currency, :timezone, :logged_in, :party_id]
    arr.each do |key|
      attrs[key] = self.send(key)
    end
    attrs
  end

  # nodoc
  def self.get_path
    '/api/users'
  end

  # nodoc
  def self.init_many(response)
    data = response['users']['user']
    CapsuleCRM::Collection.new(self, data)
  end

  # nodoc
  def self.init_one(response)
    return CapsuleCRM::Task.init_one(response) if response['user']
    raise CapsuleCRM::RecordNotRecognised, "Could not recognise returned entity type: #{response}"
  end

  # nodoc
  def self.xml_map
    map = {
      'username' => 'username',
      'name' => 'name',
      'currency' => 'currency',
      'timezone' => 'timezone',
      'loggedIn' => 'logged_in',
      'partyId' => 'party_id',
    }
    super.merge map
  end
end
