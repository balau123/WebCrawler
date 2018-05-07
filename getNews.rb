require_relative "News/News"

class GetNews < News
  def initialize()
    require 'rss'
    require 'open-uri'
    @rss_results = []
  end
  
  def vnexpress(type=:tintuc,count=5)
    rss = RSS::Parser.parse(open(@@list_vnexpress_category[type]).read, false).items[0..count]
    rss.each do |result|
      d=result.description
      image=d.scan(/src(.*)[=](.*)["' ']>/)
      content=d.scan(/br>(.*)/)
      image=image.join('')
      content=content.join('')  
      r = { title: result.title, date: result.pubDate, link: result.link, content: content, img: image }
      @rss_results.push(r)
    end 
  end
  
  def show_vnexpress()
    @rss_results.map.with_index { |r,index|
      puts "\n%d\n| Title: %s \n Date: %s \n Link: %s \n Img:%s \nDescription: %s" % [index,r[:title],r[:date],r[:link],r[:img],r[:content]]
    }
  end
	#===============================================================

  def dantri(type=:tintuc,count=5)
    rss = RSS::Parser.parse(open(@@list_dantri_category[type]).read, false).items[0..count]
    rss.each do |result|
      d=result.description
      image=d.scan(/src(.*)[=](.*)["' ']>/)
      content=d.scan(/br>(.*)/)
      image=image.join('')
      content=content.join('')  
      r = { title: result.title, date: result.pubDate, link: result.link, content: content, img: image }
      @rss_results.push(r)
    end 
  end

  def show_dantri()
    @rss_results.map.with_index { |r,index|
      puts "\n%d\n| Title: %s \n Date: %s \n Link: %s \n Img:%s \nDescription: %s" % [index,r[:title],r[:date],r[:link],r[:img],r[:content]]
    }
	end
  
end

n=GetNews.new()
#n.vnexpress(:thethao,20)
#n.show_vnexpress()
n.dantri(:thoisu,20)
n.show_dantri()


