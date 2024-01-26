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
    @html_data, @offer_data = html_data.search(".panel-body h5.nomargin"), html_data.search(".list-group")
    # $html_data, $offer_data = @html_data, @offer_data
  end

  def parse_detail_data
    parse_data
    parse_underwriters
    parse_company_overview
    parse_offer
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
    {code: 0, sector: 1, sub_sector: 2, line_of_business: 3, address: 5, website: 6, percentage_of_share: 8, participant_admin: 9 }.each do |key, value|
      @data[key] = @html_data[value].next.text
    end
  end

  def parse_underwriters
    data = []
    unless @html_data[10].next.children.count == 2
      @html_data[10].next.children.each.with_index(1) do |s, i|
        next if i%2 == 0
        data << s.text
      end
    else
      data << @html_data[10].next.text
    end
    @data[:underwriters] = data
  end

  def parse_offer

    @offer_data.search(".list-group-item").each do |offer|
      heading = offer.search("h5").text
      case heading
      when "Book Building"
        build_book_building(offer)
      when "Offering"
        build_offering(offer)
      when "Distribution"
        build_distribution(offer)
      when "Listing Date"
        build_listing_data(offer)
      when "Additional Information"
        @data[:additional_information] = "#{Rails.application.config.eipo_base_url}#{offer.search('p a').attr("href")}" # rescue nil
      when "Prospectus"
        @data[:prospectus] = offer.search("p a").map{|c| "#{Rails.application.config.eipo_base_url}#{c.attr("href")}"}
      when "Allotment (Close)"
        @data[:allotment_date] = offer.search('p').first.text
      when "Allotment"
        @data[:allotment_date] = offer.search('p').first.text
      else
        nil
      end
    end
  end

  private
    def build_book_building(offer)
      date = parse_interval_date(offer.search('p').first.text)
      @data[:book_building_start_date], @data[:book_building_end_date] = date.first, date.last
      price = offer.search('p').last.text.split(" - ")
      min_price, max_price = format_price(price.first), format_price(price.last)
      @data[:book_building_min_price], @data[:book_building_max_price] = min_price, max_price
    end

    def build_offering(offer)
      date = parse_interval_date(offer.search('p').first.text)
      @data[:offering_start_date], @data[:offering_end_date] = date.first, date.last
      price = format_price(offer.search('p').last.text)
      @data[:offering_price] = price
    end

    def build_distribution(offer)
      @data[:distribution_date] = offer.search('p').first.text
    end

    def build_listing_data(offer)
      @data[:listing_date] = offer.search('p').first.text
    end

    def parse_interval_date(date)
      date.split(" - ")
    end

    def format_price(price)
      price.gsub("IDR", "")[1..-1].to_i
    end

end


# @browser.visit("https://e-ipo.co.id/en/ipo/291/mkap-pt-multikarya-asia-pasifik-raya-tbk")
# detail = Nokogiri::HTML(@driver.page_source)
# d = DetailParser.new(detail)
