class IndexPage < Scrapper

  def parse
    IndexParser.new(html_data).parse_index_data
  end

  def insert_to_db(data)
    data.each do |emiten|
      e = Emiten.new(emiten)
      e.upsert
    end
  end

end
