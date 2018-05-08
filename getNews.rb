require_relative "News/News"
require 'rss'
require 'open-uri'

class GetNews
  def initialize()
    @rss_results = []
		@n=News.new()
  end

	#===============================================================
  def craw(_page,_type=:tintuc,count=5)
		@page=getPage(_page,_type)
		begin
    	rss = RSS::Parser.parse(open(@page).read, false).items[0..count]
		rescue
			puts "[Link Died]: #@page"
		ensure
		  rss.each do |result|
		    d=result.description
		    image=d.scan(/src(.*)[=](.*)["' ']/)
		    content=d.scan(/br>(.*)/)
		    image=image.join('')
		    content=content.join('')  
		    r = { title: result.title, date: result.pubDate, link: result.link, content: content, img: image }
		    @rss_results.push(r)
			end
    end 
  end

  def show()
    @rss_results.map.with_index { |r,index|
      puts "\n%d\n|Title: %s \n|Date: %s \n|Link: %s \n|Img:%s \n|Content: %s" % [index,r[:title],r[:date],r[:link],r[:img],r[:content]]
    }
	end
  
	def getPage(_page,_type)
		@n.pages[_page][_type]
	end

end

n=GetNews.new()
#puts n.getPage('vtc',:tintuc)
#n.craw('vtc',:tintuc	,10)
n.craw('vtc',:khoahoc	,10)
n.show()


