class News
  @@list_vnexpress_category={
  :tintuc 	 => 'https://vnexpress.net/rss/tin-moi-nhat.rss',
  :kinhdoanh => 'https://vnexpress.net/rss/kinh-doanh.rss',
  :thoisu    => 'https://vnexpress.net/rss/thoi-su.rss',
  :thethao   => 'https://vnexpress.net/rss/the-thao.rss',
  :thegioi   => 'https://vnexpress.net/rss/the-gioi.rss',
  :giaoduc   => 'https://vnexpress.net/rss/giao-duc.rss',
  :congnghe  => 'https://vnexpress.net/rss/so-hoa.rss',
  :khoahoc   => 'https://vnexpress.net/rss/so-hoa.rss',
	:suckhoe	 => 'https://vnexpress.net/rss/suc-khoe.rss'
  }

  @@list_dantri_category={
  :tintuc    => 'http://dantri.com.vn/trangchu.rss',
  :thoisu    => 'http://dantri.com.vn/xa-hoi.rss',
  :kinhdoanh => 'http://dantri.com.vn/kinh-doanh.rss',
  :thethao   => 'http://dantri.com.vn/the-thao.rss',
  :thegioi   => 'http://dantri.com.vn/the-gioi.rss',
  :giaoduc   => 'http://dantri.com.vn/giao-duc-khuyen-hoc.rss',
  :congnghe  => 'http://dantri.com.vn/suc-manh-so.rss',
  :khoahoc   => 'http://dantri.com.vn/khoa-hoc-cong-nghe.rss',
	:suckhoe	 =>'http://dantri.com.vn/suc-khoe.rss'
  }



  
  def initialize()
    require 'rss'
    require 'open-uri'
    @rss_results = []
  end
end
