class Loot
  MAX_PAGE = 17

  def self.looting
    (1..MAX_PAGE).each do |page|
      index = IndexPage.new("#{Rails.application.config.eipo_base_url}/en/ipo/index?page=#{page.to_s}&per-page=12")
      data = index.parse
      index.insert_to_db(data)
    end
  end
end
