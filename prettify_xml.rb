require 'nokogiri'

def pretty_print_xml(xml='')
  doc = Nokogiri.XML(xml) do |config|
    config.default_xml.noblanks
  end
  puts doc.to_xml(:indent => 2)
end

xml = File.read(ARGV[0])
puts pretty_print_xml(xml)