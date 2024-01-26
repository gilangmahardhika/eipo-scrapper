class DetailPage < Scrapper
  def parse
    DetailParser.new(html_data).parse_detail_data
  end

  def insert_to_db(data)
    emiten = Emiten.find_by(code: data[:code])
    if emiten.present?
      emiten.detail.upsert(data)
    else
      emiten.build_detail(data).save
    end
  end
end
