class Scrapper

  def initialize(emiten)
    url = if emiten.is_a?(Emiten)
      emiten.link
    else
      emiten
    end
    @worker = Worker.new
    @worker.scrape("#{Rails.application.config.eipo_base_url}#{url}")
  end

  def html_data
    @html_data = @worker.html_data
  end

end
