require 'digest'

module TheCommunityFarm
  class OrganicBoxes
    # Represents a single organic veg box.
    class Box
      def initialize(noko:)
        @noko = noko
      end

      def name
        @name ||= "#{type} #{box_size}".strip
      end

      def type
        @type ||= noko.at_css('.lead').text.strip
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

      def items_sha
        @items_sha ||= Digest::SHA1.hexdigest(items.join("\n"))
      end

      def to_s
        name
      end

      def to_h
        {
          name: name,
          type: type,
          size: box_size,
          items: items,
          items_sha: items_sha
        }
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
