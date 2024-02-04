class Emiten
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code, type: String
  field :name, type: String
  field :eipo_id, type: Integer
  field :link, type: String
  field :shared_lot, type: Integer
  field :logo, type: String
  field :final_price, type: Integer
  field :status, type: String

  embeds_one :detail

  SCRAPPED_STATUS = ["Book Building", "Offering", "Allotment", "Pre-Effective"]

  default_scope -> { order(eipo_id: :desc) }

  validates_uniqueness_of :code, :eipo_id

  def scrape
    detail = DetailPage.new(self)
    detail.insert_to_db(detail.parse)
  end

  def self.uncompleted
    where(:status.in => SCRAPPED_STATUS)
  end

  def as_json
    {
      id:    self._id.to_s,
      code:  self.code,
      eipo_id: self.eipo_id,
      name:  self.name,
      shared_lot: self.shared_lot,
      logo: self.logo,
      final_price: self.detail.offering_price,
      status: self.status,
      sector: self.detail.sector,
      sub_sector: self.detail.sub_sector,
      line_of_business: self.detail.line_of_business,
      company_overview: self.detail.company_overview,
      address: self.detail.address,
      website: self.detail.website,
      percentage_of_share: self.detail.percentage_of_share,
      participant_admin: self.detail.participant_admin,
      underwriters: self.detail.underwriters,
      offering_start_date: self.detail.offering_start_date.try(:to_time),
      offering_end_date: self.detail.offering_end_date.try(:to_time),
      offering_price: self.detail.offering_price,
      allotment_date: self.detail.allotment_date.try(:to_time),
      distribution_date: self.detail.distribution_date.try(:to_time),
      book_building_start_date: self.detail.book_building_start_date.try(:to_time),
      book_building_end_date: self.detail.book_building_start_date.try(:to_time),
      book_building_min_price: self.detail.book_building_min_price,
      book_building_max_price: self.detail.book_building_max_price,
      listing_date: self.detail.listing_date.try(:to_time),
      prospectus: self.detail.prospectus,
      additional_information: self.detail.additional_information,
  }.to_json
  end
end
