require 'the_community_farm'
require 'open-uri'

organic_boxes = TheCommunityFarm::OrganicBoxes.new(html: open('https://www.thecommunityfarm.co.uk/boxes/box_display.php').read)

organic_boxes.each do |box|
  puts box
  puts
  box.items.each { |item| puts "- #{item}" }
  puts
end
