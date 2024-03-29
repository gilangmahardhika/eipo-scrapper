class Loot
  MAX_PAGE = 8

  def self.looting
    (1..MAX_PAGE).each do |page|
      index = IndexPage.new("/en/ipo/index?page=#{page.to_s}&per-page=12")
      data = index.parse
      index.insert_to_db(data)
    end
  end

  def self.update_all_details
    Emiten.all.each do |e|
      detail = DetailPage.new(e)
      detail.insert_to_db(detail.parse)
      sleep(0.5)
    end
  end

  def self.update_uncompleted
    Emiten.uncompleted.each do |e|
      detail = DetailPage.new(e)
      detail.insert_to_db(detail.parse)
      sleep(0.5)
    end
  end
end
