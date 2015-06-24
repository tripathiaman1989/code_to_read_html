require 'nokogiri'
require 'open-uri'
class Test
  def html_read
	# Absolute path or file should be in current directory needed	
	html = Nokogiri::HTML(IO.read 'test.html') 
	text  = html.at('body').inner_text
 	words = text.scan(/\w+/)
	po_number=[];tracker_id=[]
 	words.each_with_index {|element, index|
 		po_number << words[index+2] if element == "PO" and words[index+1] == "Number"
 		tracker_id << words[index+2] if element == "Track" and words[index+1] == "It"
	}
	formated_arr = po_number.zip tracker_id
	puts "Final parse array: " + formated_arr.to_s
  end
end

hello = Test.new
hello.html_read
