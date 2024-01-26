class Detail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :shared_offered, type: Integer
  field :sector, type: String
  field :sub_sector, type: String
  field :line_of_business, type: String
  field :company_overview, type: String
  field :address, type: String
  field :website, type: String
  field :percentage_of_share, type: Integer
  field :participant_admin, type: String
  field :underwriters, type: Object
  field :code, type: String

  ## Offer
  field :offering_start_date, type: Date
  field :offering_end_date, type: Date
  field :offering_price, type: Integer
  field :allotment_date, type: Date
  field :distribution_date, type: Date
  field :listing_date, type: Date
  field :prospectus, type: Object
  field :additional_information, type: String
  field :book_building_start_date, type: Date
  field :book_building_end_date, type: Date
  field :book_building_min_price, type: Integer
  field :book_building_max_price, type: Integer

  embedded_in :emiten
end
