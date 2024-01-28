class Scrapper

  def initialize(emiten)
    url = if emiten.is_a?(Emiten)
      emiten.link
    else
      emiten
    end
    @worker = Worker.new.scrape("#{Rails.application.config.eipo_base_url}#{url}")
  end

  def html_data
    @html_data = Nokogiri::HTML($driver.page_source)
  end

end
