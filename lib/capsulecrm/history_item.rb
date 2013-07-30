class CapsuleCRM::HistoryItem < CapsuleCRM::Child

  attr_accessor :type
  attr_accessor :entry_date
  attr_accessor :creator
  attr_accessor :creator_name
  attr_accessor :subject
  attr_accessor :note
  attr_accessor :attachments
  attr_accessor :participants
  attr_accessor :party_id
  attr_accessor :case_id
  attr_accessor :opportunity_id

  # nodoc
  def self.xml_map
    map = {
      'type' => 'type',
      'entryDate' => 'entry_date',
      'creator' => 'creator',
      'creatorName' => 'creator_name',
      'subject' => 'subject',
      'note' => 'note',
      'attachments' => 'attachments',
      'participants' => 'participants',
      'partyId' => 'party_id',
      'caseId' => 'case_id',
      'opportunityId' => 'opportunity_id',
    }
    super.merge map
  end


end
