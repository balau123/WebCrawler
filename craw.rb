require 'mechanize'
agent = Mechanize.new
 




podcast_url = "https://thanhnien.vn/kinh-doanh/nhieu-ong-lon-ngan-hang-sa-lay-trong-dau-tu-tai-chinh-964840.html"


page = agent.get(podcast_url) 
html = Nokogiri::HTML(page.body)


 content_vnexpress = html.xpath('//article//p[@class="Normal"]').text
 
 content_thanhnien = html.xpath('//div[@id="main_detail"]//div').text
  content_thanhnien = html.xpath('//div[@id="abody"]//div[@class="details__morenews"]').text
 
 content_laodong = html.xpath('//div[@class="article-content"]').text
 content_tuoitre = html.xpath('//div[@class="fck"]//p').text
 content_vtc = html.xpath('//div[@class="single-main-content"]//p').text
 content_dantri = html.xpath('//div[@id="divNewsContent"]//p').text
 content_nhandan = html.xpath('//div[@class="ndcontent"]//p').text



#puts content_vnexpress
 puts content_thanhnien
#puts content_laodong
#puts content_tuoitre
#puts content_vtc
#puts content_dantri
#puts content_nhandan
#.map { |div| puts div.content }

