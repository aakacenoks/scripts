require 'nokogiri'

def prettify_xml(xml='')
  doc = Nokogiri.XML(xml) do |config|
    config.default_xml.noblanks
  end
  doc.to_xml(:indent => 2)
end

xml = File.read(ARGV[0])
pretty_xml = prettify_xml(xml)

File.open(ARGV[1], 'w') { |file| file.write(pretty_xml) }


