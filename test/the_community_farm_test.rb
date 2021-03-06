require 'test_helper'

describe 'TheCommunityFarm' do
  it 'has a version number' do
    ::TheCommunityFarm::VERSION.wont_be_nil
  end

  describe 'OrganicBoxes' do
    let(:box_display_html) { File.read('test/fixtures/box_display.html') }
    let(:boxes) { TheCommunityFarm::OrganicBoxes.new(html: box_display_html) }

    it 'contains a list of boxes' do
      boxes.count.must_equal 14
    end

    describe 'Box' do
      subject { boxes.to_a[1] }

      it 'has a type' do
        subject.type.must_equal 'Family Provider'
      end

      it 'has a size' do
        subject.box_size.must_equal 'Large'
      end

      it 'has a name method which combines the title and size' do
        subject.name.must_equal 'Family Provider Large'
      end

      it 'has a to_s method that returns the name' do
        subject.to_s.must_equal subject.name
      end

      it 'has an item sha' do
        subject.items_sha.must_equal '311fc748548acb075d123faab87e50e4c64a22b8'
      end

      it 'has a list of items' do
        subject.items.must_equal [
          'Potatoes (Valor) (Somerset)',
          'Carrots (Dirty) (Somerset)',
          'Parsnips (Somerset)',
          'Cauliflower (Green) (Somerset)',
          'Brussel Sprout Tops (Somerset)',
          'Cabbage (White) (Our Field)',
          'Butternut Squash (Somerset)',
          'Leeks (our field)',
          'Sweetcorn (Somerset)',
          'Beetroot (Somerset)',
          'Apples  (Hereford)',
          'Bananas (Ecuador)',
          'Oranges (SPA)'
        ]
      end

      it 'has a #to_h method' do
        subject.to_h.must_equal(
          name: 'Family Provider Large',
          type: 'Family Provider',
          size: 'Large',
          items: [
            'Potatoes (Valor) (Somerset)',
            'Carrots (Dirty) (Somerset)',
            'Parsnips (Somerset)',
            'Cauliflower (Green) (Somerset)',
            'Brussel Sprout Tops (Somerset)',
            'Cabbage (White) (Our Field)',
            'Butternut Squash (Somerset)',
            'Leeks (our field)',
            'Sweetcorn (Somerset)',
            'Beetroot (Somerset)',
            'Apples  (Hereford)',
            'Bananas (Ecuador)',
            'Oranges (SPA)'
          ],
          items_sha: '311fc748548acb075d123faab87e50e4c64a22b8'
        )
      end
    end
  end
end
