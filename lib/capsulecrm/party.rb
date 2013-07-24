class CapsuleCRM::Party < CapsuleCRM::Base


  # nodoc
  def addresses
    return @addresses if @addresses
    data = raw_data['contacts'].try(:[], 'address')
    @addresses = CapsuleCRM::Address.init_many(self, data)
  end

  # nodoc
  def custom_fields
    return @custom_fields if @custom_fields
    path = self.class.get_path
    path = [path, '/', id, '/customfield'].join
    last_response = self.class.get(path)
    data = last_response['customFields'].try(:[], 'customField')
    @custom_fields = CapsuleCRM::CustomField.init_many(self, data)
  end

  #nodoc
  def history_items
    return @history_items if @history_items
    path = self.class.get_path
    path = [path, '/', id, '/history'].join
    last_response = self.class.get(path)
    data = last_response['history'].try(:[], 'historyItem')
    @history_items = CapsuleCRM::HistoryItem.init_many(self, data)
  end

  #nodoc
  
  def tasks
    return @tasks if @tasks
    path = self.class.get_path
    path = [path, '/', id, '/tasks'].join
    last_response = self.class.get(path)
    data = last_response['tasks'].try(:[], 'task')
    @tasks = CapsuleCRM::Task.init_many(self, data)
  end


  def tags
    return @tags if @tags
    path = self.class.get_path
    path = [path, '/', id, '/tag'].join
    last_response = self.class.get(path)
    #raise last_response.inspect
    data = last_response['tags'].try(:[], 'tag')
    @tags = CapsuleCRM::Tag.init_many(self, data)
  end


  def tag_names
    tags.map(&:name)
  end

  # nodoc
  def emails
    return @emails if @emails
    data = raw_data['contacts'].try(:[], 'email')
    @emails = CapsuleCRM::Email.init_many(self, data)
  end


  # nodoc
  def phone_numbers
    return @phone_numbers if @phone_numbers
    data = raw_data['contacts'].try(:[], 'phone')
    @phone_numbers = CapsuleCRM::Phone.init_many(self, data)
  end

  # nodoc
  def websites
    return @websites if @websites
    data = raw_data['contacts'].try(:[], 'website')
    @websites = CapsuleCRM::Website.init_many(self, data)
  end

  def is?(kind)
    required_class = kind.to_s.camelize
    self.class.to_s.include? required_class
  end

  # nodoc
  def self.get_path
    '/api/party'
  end


  def self.find_all_by_email(email, options={})
    options[:email] = email
    find_all(options)
  end


  # nodoc
  def self.find_by_email(email)
    find_all_by_email(email, :limit => 1, :offset => 0).first
  end


  # nodoc
  def self.search(query, options={})
    options[:q] = query
    find_all(options)
  end

  def self.init_one(response)
    return CapsuleCRM::Person.init_one(response) if response['person']
    return CapsuleCRM::Organisation.init_one(response) if response['organisation']
    raise CapsuleCRM::RecordNotRecognised, "Could not recognise returned entity type: #{response}"
  end
end
