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
  field :underwriters, type: String
  field :code, type: String

  embedded_in :detail
end
