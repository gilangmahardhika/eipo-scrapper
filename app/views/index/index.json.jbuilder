json.data do
  json.array! @emitens do |emiten|
    json.id     emiten._id.to_s
    json.code   emiten.code
    json.name   emiten.name
    json.status emiten.status
    json.sector emiten.detail.sector
    json.sector emiten.detail.sector
    json.sub_sector emiten.detail.sub_sector
    json.line_of_business emiten.detail.line_of_business
    json.updated_at emiten.updated_at
  end
end
