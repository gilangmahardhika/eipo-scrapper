json.data do
  json.array! @emitens do |emiten|
    json.id     emiten._id.to_s
    json.code   emiten.code
    json.name   emiten.name
    json.logo   emiten.logo
    json.status emiten.status
    json.final_price emiten.detail.offering_price
    json.shared_lot emiten.shared_lot
    json.sector emiten.detail.sector
    json.sector emiten.detail.sector
    json.sub_sector emiten.detail.sub_sector
    json.line_of_business emiten.detail.line_of_business
    json.prospectus emiten.detail.prospectus
    json.additional_information emiten.detail.additional_information
    json.updated_at emiten.updated_at
    json.current_time Time.now
  end
end
