class CapsuleCRM::Assignment < CapsuleCRM::Base
  attr_accessor :party_id
  attr_accessor :party_name
  attr_accessor :opportunity_id
  attr_accessor :opportunity_name
  attr_accessor :case_id
  attr_accessor :case_name
  attr_accessor :due_date
  attr_accessor :due_date_time
  attr_accessor :completed_on
  attr_accessor :description
  attr_accessor :detail
  attr_accessor :owner
  attr_accessor :category
  attr_accessor :status


  define_attribute_methods [:party_id, :party_name, :opportunity_id, :opportunity_name, 
                            :case_id, :case_name, :due_date, :due_date_time,  
                            :completed_on, :description, :detail, :owner, :category, :status]

  # nodoc
  def attributes
    attrs = {}
    arr = [:party_id, :party_name, :opportunity_id, :opportunity_name, 
                            :case_id, :case_name, :due_date, :due_date_time,  
                            :completed_on, :description, :detail, :owner, :category, :status]
    arr.each do |key|
      attrs[key] = self.send(key)
    end
    attrs
  end

  # nodoc
  def self.get_path
    '/api/tasks'
  end

  # nodoc
  def self.search(query, options={})
    options[:q] = query
    find_all(options)
  end

  def self.query_params(options)
    params = options.dup
    params[:status] = params[:q].delete(:status) if params[:q] && params[:q].has_key?(:status)
    params[:start] = params.delete(:offset) if params.has_key?(:offset)
    params
  end

  # nodoc
  def self.init_many(response)
    data = response['tasks']['task']
    CapsuleCRM::Collection.new(self, data)
  end

  # nodoc
  def self.init_one(response)
    return CapsuleCRM::Task.init_one(response) if response['task']
    raise CapsuleCRM::RecordNotRecognised, "Could not recognise returned entity type: #{response}"
  end

  # nodoc
  def self.xml_map
    map = {
      'partyId' => 'party_id',
      'partyName' => 'party_name',
      'opportunityId' => 'opportunity_id',
      'opportunityName' => 'opportunity_name',
      'caseId' => 'case_id',
      'caseName' => 'case_name',
      'dueDate' => 'due_date',
      'dueDateTime' => 'due_date_time',
      'completedOn' => 'completed_on',
      'description' => 'description',
      'detail' => 'detail',
      'category' => 'category',
      'owner' => 'owner',
      'status' => 'status'
    }
    super.merge map
  end
end
