require 'nokogiri'
require 'open-uri'
require 'ranNUM'

puts "Enter google search"
google_search = gets
puts "How many results per page?"
$google_amount_per_page = gets.to_i

puts "How many Results in total? Each page will be given in multiples of #{$google_amount_per_page}"
$google_amount_link_total = gets.to_i
$google_amount_link_start = 0

until $google_amount_link_start >= $google_amount_link_total  do
    #parse data in google to URL
    html_data = open("http://www.google.com/search?q=#{google_search}&num=#$google_amount_per_page&start=#$google_amount_link_start").read
    nokogiri_object = Nokogiri::HTML(html_data)
    search_elements = nokogiri_object.xpath("//h3[@class='r']/a/@href")
    search_elements.each do |search_element|
        puts search_element.text.gsub('/url?q=', '').gsub(/&sa=.*/, '')
    end
   $google_amount_link_start +=$google_amount_per_page;
   sleep(RAN.num(30))
end

