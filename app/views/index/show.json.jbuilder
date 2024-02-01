json.data do
  json.id     @emiten._id.to_s
  json.code   @emiten.code
  json.name   @emiten.name
  json.status @emiten.status
  json.sector @emiten.detail.sector
  json.sub_sector @emiten.detail.sub_sector
  json.line_of_business @emiten.detail.line_of_business
  json.company_overview @emiten.detail.company_overview
  json.website @emiten.detail.website
  json.percentage_of_share @emiten.detail.percentage_of_share
  json.participant_admin @emiten.detail.participant_admin
  json.underwriters @emiten.detail.underwriters
  json.updated_at @emiten.updated_at
  json.allotment_date  @emiten.detail.allotment_date
  json.book_building_start_date  @emiten.detail.book_building_start_date
  json.book_building_end_date  @emiten.detail.book_building_start_date
  json.book_building_min_price @emiten.detail.book_building_min_price
  json.book_building_max_price @emiten.detail.book_building_max_price
  json.shared_lot @emiten.shared_lot
  json.offering_start_date @emiten.detail.offering_start_date
  json.offering_end_date @emiten.detail.offering_end_date
  json.offering_price @emiten.detail.offering_price
  json.distribution_date @emiten.detail.distribution_date
  json.listing_date @emiten.detail.listing_date
  json.prospectus @emiten.detail.prospectus
  json.additional_information @emiten.detail.additional_information
end
