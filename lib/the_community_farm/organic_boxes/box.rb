require 'digest'

module TheCommunityFarm
  class OrganicBoxes
    class Box
      def initialize(noko:)
        @noko = noko
      end

      def id
        Digest::MD5.new.tap do |id|
          id.update(title)
          id.update(items.join("\n"))
        end.hexdigest
      end

      def title
        @title ||= noko.at_css('.lead').text.strip
      end

      def box_size
        @box_size ||= begin
          size = noko.at_css('option[selected]')
          size && size.text && size.text.strip
        end
      end

      def items
        @items ||= item_doc.css('li').map { |li| li.text.strip }
      end

      def to_s
        "#{title} #{box_size}".strip
      end

      private

      attr_reader :noko

      def item_doc
        @item_doc ||= Nokogiri::HTML(noko.at_css(item_selector)['data-content'])
      end

      def item_selector
        %([data-content*="This week's contents"])
      end
    end
  end
end
