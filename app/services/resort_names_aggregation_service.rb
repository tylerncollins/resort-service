require 'open-uri'
require 'nokogiri'

class ResortNamesAggregationService < ApplicationService
  def initialize
    @resort_names = []
  end

  def call
    resort_tags = parse_html
    resort_tags.each do |tag|
      @resort_names << tag.content
    end
    @resort_names
  end

  private 

  def parse_html
    doc = Nokogiri::HTML.parse(URI.open("https://www.myweather2.com/Ski-Resorts/United-States-Of-America/all.aspx", "Accept-Encoding" => "plain"))
    tags = doc.xpath('//*[@id="maincountry"]/div/a')
  end
end
