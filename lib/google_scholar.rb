require 'open-uri'
require 'nokogiri'

class GoogleScholar
  class Article
    attr_accesor :title, :url, :num_citations, :num_versions, :url_citations, :url_versions, :year, :url_related_articles

    def initialize
      @title = '',
      @url   = '',
      @num_citations = 0,
      @num_versions = 0,
      @url_citations = '',
      @url_versions = '',
      @year = 0,
      @url_related_articles = ''
    end
  end

  def self.parse(query)
    scholar_url = "http://scholar.google.com/scholar?hl=en&q=#{query}&btnG=Search&as_subj=eng&as_std=1,5&as_ylo=&as_vis=0"
    encoded_url = URI.encode(scholar_url)
    result = Nokogiri::HTML(open(URI.parse(encoded_url)))
    articles = []

    result.css('div.gs_r').map do |tag|
      arc = Article.new
      arc.title = tag.at_css('h3.gs_rt a').text
      arc.url = tag.at_css('h3.gs_rt a')[:href]
      arc.num_citations =
      articles << arc
    end

    articles.each do |arc|
      puts arc.title
    end
  end
end
