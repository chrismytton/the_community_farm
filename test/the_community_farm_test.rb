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

      it 'has an id' do
        subject.id.must_equal '9a606eed390f8788a82b557b5c9cbeeb'
      end

      it 'has a title' do
        subject.title.must_equal 'Family Provider'
      end

      it 'has a size' do
        subject.box_size.must_equal 'Large'
      end

      it 'has a to_s method which combines the title and size' do
        subject.to_s.must_equal 'Family Provider Large'
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
    end
  end
end
