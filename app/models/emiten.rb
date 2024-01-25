class Emiten
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code, type: String
  field :name, type: String
  field :eipo_id, type: Integer
  field :link, type: String
  field :status, type: String

  embeds_one :detail

  SCRAPPED_STATUS = ["Book Building", "Offering", "Allotment", "Pre-Effective"]


  validates_uniqueness_of :code, :eipo_id

  def self.find_scrapped_link
    where(:status.in => SCRAPPED_STATUS ).map(&:link)
  end
end
