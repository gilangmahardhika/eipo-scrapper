class DetailPage < Scrapper
  def parse
    DetailParser.new(html_data).parse_detail_data
  end

  def insert_to_db(data)
    emiten = Emiten.find_by(code: data[:code])
    unless emiten.present?
      emiten.detail.upsert(data).save
    else
      emiten.build_detail(data)
    end
  end
end
