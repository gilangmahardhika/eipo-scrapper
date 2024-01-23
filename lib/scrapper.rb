class Scrapper

  def initialize(url)
    $browser.visit(url)
    @doc = Nokogiri::HTML($driver.page_source)
  end

end
