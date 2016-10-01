require 'nokogiri'
require 'the_community_farm/organic_boxes/box'

module TheCommunityFarm
  class OrganicBoxes
    include Enumerable

    def initialize(html:)
      @html = html
    end

    def each(&block)
      boxes.each(&block)
    end

    private

    attr_reader :html

    def boxes
      noko.css('.panel').map { |p| Box.new(noko: p) }
    end

    def noko
      @noko ||= Nokogiri::HTML(html)
    end
  end
end
