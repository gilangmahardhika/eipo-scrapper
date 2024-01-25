# field :shared_offered, type: Integer
# field :sector, type: String
# field :sub_sector, type: String
# field :line_of_business, type: String
# field :company_overview, type: String
# field :address, type: String
# field :website, type: String
# field :percentage_of_share, type: Integer
# field :participant_admin. type: String
# field :underwriters, type: String
# field :eipo_id, type: Integer

class DetailParser
  def initialize(html_data)
    @data = {}
    @html_data = html_data.search(".panel-body h5.nomargin")
  end

  def parse_detail_data
    parse_data
    parse_company_overview
    @data
  end

  def parse_company_overview
    command = "@html_data[4].next"
    @data[:company_overview] = ""
    result = nil
    (1..10).each do |i|
      result = eval(command)
      break if result.class != String && result.try(:name) == "h5"
      @data[:company_overview] += result.text
      command = command += ".next"
    end
  end

  def parse_data
    {code: 0, sector: 1, sub_sector: 2, line_of_business: 3, address: 5, website: 6, percentage_of_share: 8, participant_admin: 9, underwriters: 10 }.each do |key, value|
      @data[key] = @html_data[value].next.text
    end
  end

end


# $browser.visit("https://e-ipo.co.id/en/ipo/291/mkap-pt-multikarya-asia-pasifik-raya-tbk")
# detail = Nokogiri::HTML($driver.page_source)
# d = DetailParser.new(detail)
