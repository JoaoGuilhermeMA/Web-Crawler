require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open('https://www.imdb.com/chart/top/?ref_=nv_mv_250'))

table = doc.css('table.chart').css('tbody.lister-list')

table.search('tr').each do |tr|
  title = tr.css('td.titleColumn').css('a').text
  note = tr.css('td.ratingColumn').css('strong').text

  puts title + ' ' + note
  next if tr['class'] == 'watchlistColumn'
end
