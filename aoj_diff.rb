require 'open-uri'
require 'rexml/document'
require './aoj.rb'

if ARGV.size != 2 then
	puts "ARGV error"
	exit(-1)
end
aslv = AOJ::solved_list(ARGV[0])
bslv = AOJ::solved_list(ARGV[1])
puts "<h2>only #{ARGV[0]} solved problems</h2>"
(aslv-bslv).each do |x|
	puts AOJ::get_url(x,1)
end
puts "<h2>only #{ARGV[1]} solved problems</h2>"
(bslv-aslv).each do |x|
	puts AOJ::get_url(x,1)
end
puts "<h2>#{ARGV[0]} and #{ARGV[1]} solved problems</h2>"
(aslv&bslv).each do |x|
	puts AOJ::get_url(x,1)
end
