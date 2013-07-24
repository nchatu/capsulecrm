class CapsuleCRM::Task < CapsuleCRM::Child

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
      'owner' => 'owner',
      'category' => 'category',
      'status' => 'status'
    }
    super.merge map
  end


end
