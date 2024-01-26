class Scrapper

  def initialize(url)


    @worker = Worker.new.scrape("#{Rails.application.config.eipo_base_url}#{url}")
  end

  def html_data
    @html_data = Nokogiri::HTML($driver.page_source)
  end

end
