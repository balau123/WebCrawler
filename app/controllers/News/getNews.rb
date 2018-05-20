require_relative "News"
require 'rss'
require 'open-uri'
require 'mechanize'

 
class GetNews
	attr_reader :rss_results, :trend, :pages_Arr, :category_Arr

	def initialize(debug=false)
		@agent = Mechanize.new
		@trend = Hash.new(0)
		@n=News.new()
		@t=""
		@rss_results = []
		@pages_Arr=['vnexpress','dantri', 'thanhnien','nhandan','laodong','tuoitre','vtc']
		@category_Arr={
		'tintuc'    => 'Tin tức',
		'thoisu'    => 'Thời sự',
		'kinhdoanh' => 'Kinh doanh',
		'thethao'   => 'Thể thao',
		'thegioi'   => 'Thế giới',
		'giaoduc'   => 'Giáo dục',
		'congnghe'  => 'Công nghệ',
		'khoahoc'   => 'Khoa học',
		'suckhoe'   => 'Sức khỏe',
		'doisong'   => 'Đời sống',
		'xe'        => 'Xe', 
		'vanhoa'    => 'Văn hóa',
		'startup' 	=> 'Startup',
		'giaitri' 	=> 'Giải trí',
		'dulich' 	=> 'Du lịch',
		'kinhte' 	=> 'Kinh tế'
		}

		@parse={
		'vnexpress' => '//article//p[@class="Normal"]',
		#'vnexpress' => '//article[@class="content_detail fck_detail width_common block_ads_connect"]',
		
		'thanhnien' => '//div[@id="main_detail"]//div',
		'laodong' 	=> '//div[@class="article-content"]',
		'tuoitre' 	=> '//div[@class="fck"]//p',
		'vtc' 		=> '//div[@class="single-main-content"]//p',
		'dantri' 	=> '//div[@id="divNewsContent"]//p',
		'nhandan' 	=> '//div[@class="ndcontent"]//p'
		}

	end

	#===============================================================
  def craw(_page,_category=:tintuc,count=5)
		@rss=@n.getRSS(_page,_category)
		if _page!=''
			begin
		  	@recv = RSS::Parser.parse(open(@rss).read, false).items[0..count]
			rescue
				puts "[Link Died]: %s" % [_page]
				@rss_results
			ensure
				@recv.each do |result|
				  	d=result.description
					image=d.match(/src(.*)(?:jpg|jpeg|gif|png)"/)
					if image				  	
				  	image=image[0].sub("src=","").gsub('"','')
					else
						image=""
					end
					title=result.title
					content= getContent(_page,d)
				  	@r = { page: _page,title: result.title, date: result.pubDate, link: result.link, content: content, img: image }
				  	@rss_results.push(@r)
					@trend=title.split.inject(@trend) { |k,v|   k[v] += 1 ; k }
				end
			end
    end
    @rss_results
  end

	def getContentVerbose(_page, _link)
		# puts "PAGE"
		# puts _page,_link
		
		@d=""
		if _link!=''
			# puts "Page", _page
			# puts "Link", _link
			# puts "Parse",@parse[_page]
		 	page = @agent.get(_link) 
		 	html = Nokogiri::HTML(page.body)
		 	@d=html.xpath(@parse[_page]).text
		 end
		 @d
	end

	def getContent(_page,_content)
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
		@trend=@trend.sort_by {|k,v| v}.reverse
		@trend.each {|i|
		if i[1]>1
		print  i
		end
		}
	end

end


#@n=GetNews.new()
#@n.craw('vnexpress','tintuc'  ,5)
    
    # if @category
       #arr.each{ |p|
       #@n.craw(p,'tintuc',1)
       #n.show()
       #}
     #end

 # @n.rss_results.map.with_index.each {|i,index|
 # 	puts i

 # }
 #@n.show()