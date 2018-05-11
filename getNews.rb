require_relative "News/News"
require 'rss'
require 'open-uri'
@@result = Hash.new(0)

class GetNews
  def initialize()
    @rss_results = []
		@n=News.new()
		@t=""
  end

	#===============================================================
  def craw(_page,_type=:tintuc,count=5)
		@page=getPage(_page,_type)
		if @page!=''
			begin
		  	rss = RSS::Parser.parse(open(@page).read, false).items[0..count]
			rescue
				puts "[Link Died]: #@page"
			ensure
				rss.each do |result|
				  d=result.description
					image=d.match(/src(.*)(?:jpg|jpeg|gif|png)"/)
					if image				  	
				  	image=image[0].sub("src=","")
					else
						image=""
					end
					title=result.title
					content= getContent(_page,d)
				  r = { page: _page,title: result.title, date: result.pubDate, link: result.link, content: content, img: image }
				  @rss_results.push(r)
					@@result=title.split.inject(@@result) { |k,v|   k[v] += 1 ; k }
				end
			end
    end 
  end

	def getContent(_page,_content)
		#puts _content
		@content=""
		if _page == 'vtc' 
			@content=_content.scan(/a>(.*)/)
			@content=@content.join('')
		end

		if _page=='vnexpress'
			@content=_content.scan(/br>(.*)/)
			@content=@content.join('')
		end

		if _page=='nhandan' or _page=='laodong' or _page=='tuoitre'
			@content=_content
		end

		if _page=='tuoitre'
			@content=_content.scan(/a>(.*)/)
			@content=@content.join('')
		end

		if _page == 'thanhnien'
			l=['</a>','<a>','a>','<div>','<div','</div>','<p>','</p>','<em>','</em>','<br />','[',']']
			@content=_content.scan(/a>(.*)<div/)
			puts @content
		if @content.length >0	
				@content=@content.to_s
					l.each {|i| @content=@content.gsub(i,'')}
				end
		end		
		@content
	end

  def show()
    @rss_results.map.with_index { |r,index|
      puts "\n%d\n|%s|Title: %s \n|Date: %s \n|Link: %s \n|Img:%s \n|Content: %s" % [index,r[:page],r[:title],r[:date],r[:link],r[:img],r[:content]]
    }
	end

	def showR()
		hh=@@result.sort_by {|k,v| v}.reverse
		hh.each {|i|
		if i[1]>1
		print  i
		end
		}
		#puts @@result
	end

  
	def getPage(_page,_type)
		@n.pages[_page][_type]
	end

end

n=GetNews.new()
#n.craw('thanhnien',:tintuc	,10)
#n.craw('vnexpress',:tintuc	,10)
#n.craw('vtc',:tintuc	,10)
#n.craw('nhandan',:kinhte	,10)
#n.craw('laodong',:kinhte	,10)
#n.craw('tuoitre',:thoisu	,10)
#n.show()

arr=['vnexpress','dantri',	'thanhnien','nhandan','laodong','tuoitre','vtc']
arr.each{ |p|
	n.craw(p,:tintuc	,10)
	n.show()
}
#n.showR()