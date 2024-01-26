class Emiten
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :code, type: String
  field :name, type: String
  field :eipo_id, type: Integer
  field :link, type: String
  field :status, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  embeds_one :detail

  SCRAPPED_STATUS = ["Book Building", "Offering", "Allotment", "Pre-Effective"]


  validates_uniqueness_of :code, :eipo_id

  def self.uncompleted
    where(:status.in => SCRAPPED_STATUS)
  end
end
