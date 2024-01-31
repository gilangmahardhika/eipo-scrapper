class IndexPage < Scrapper

  def parse
    IndexParser.new(html_data).parse_index_data
  end

  def insert_to_db(data)
    data.each do |emiten|
      e = Emiten.where(code: emiten[:code]).first
      if e.present?
        e.update(emiten)
        # e.touch
      else
        Emiten.new(emiten).save
      end
    end
  end

end
