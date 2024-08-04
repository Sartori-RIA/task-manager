
class ScrapingService
  include Nokogiri

  def initialize(url)
    @url = url
  end

  def scrape
    html = open(@url)
    doc = Nokogiri::HTML(html)
    byebug
    "do something with the content"
  end
end