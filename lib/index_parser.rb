class IndexParser

  def initialize(html_data)
    @data = []
    @html_data = html_data.search("#ipo-list .list-view .row").children
  end

  def parse_index_data
    total_data = @html_data.size
    total_loop = if total_data == 4
      1
    else
      total_data - 2
    end
    puts total_loop
    for i in (0..total_loop) do
      next if i.odd? || i >= 22
      @data << {
        name: name(@html_data[i]),
        code: code(@html_data[i]),
        eipo_id: eipo_id(@html_data[i]),
        link: link(@html_data[i]),
        status: status(@html_data[i]),
        updated_at: Time.now
      }
    end
    @data
  end

  private
    def name(div)
      div.search('h5.nobottommargin').first.text[0...-6]
    end

    def code(div)
      div.search("div/div/div.padding10/img").attr('alt').value
    end

    def eipo_id(div)
      div.attribute('data-key').value
    end

    def status(div)
      div.search('.pricing-title h3').children.text
    end

    def link(div)
      div.search(".pricing-action/a").attr('href').value
    end
end
