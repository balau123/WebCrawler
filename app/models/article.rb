class Article < ApplicationRecord
	BASE_TINHTE_URL = "https://tinhte.vn"
  LIST_URL = "https://tinhte.vn/?wpage="
  class << self
   #hàm crawl dữ liệu theo số trang yêu cầu
   def crawl_article number_of_page
   hrefs = []
   1.upto(number_of_page) do |x|
     url = LIST_URL + x.to_s
     page = Nokogiri::HTML(open(url))
     doc = page.css(".subHeading")
     hrefs = hrefs + doc.css("a").map {|a|
       a["href"]
     }.compact.uniq
   end
   hrefs.each do |href|
     remote_url = BASE_TINHTE_URL + href
     begin
       #Get dữ liệu bằng Nokogiri
       tinhte_content = Nokogiri::HTML(open(remote_url))
       #lấy title của bài viết bằng cách tìm thành phần css có class là title và convert về dạng text
       title = tinhte_content.css("title").first.text
       #lấy content của bài viết bằng cách xác định class css
       content = tinhte_content.css(".uix_discussionAuthor .baseHtml").text
       #tạo một article mới
       Article.create! title: title, content: content
       ensure
       #tạo thời gian nghỉ cho các request để tránh bị coi là tấn công ddos
       sleep 1.0 + rand
     end
   end
end
