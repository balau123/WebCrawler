class News
	attr_reader :vnexpress,:dantri,:thanhien,:nhandan,:laodong,:tuoitre,:vtc, :pages
  def initialize()
		@vnexpress={
		:tintuc    => 'https://vnexpress.net/rss/tin-moi-nhat.rss',
		:kinhdoanh => 'https://vnexpress.net/rss/kinh-doanh.rss',
		:thoisu    => 'https://vnexpress.net/rss/thoi-su.rss',
		:thethao   => 'https://vnexpress.net/rss/the-thao.rss',
		:thegioi   => 'https://vnexpress.net/rss/the-gioi.rss',
		:giaoduc   => 'https://vnexpress.net/rss/giao-duc.rss',
		:congnghe  => 'https://vnexpress.net/rss/so-hoa.rss',
		:khoahoc   => 'https://vnexpress.net/rss/so-hoa.rss',
		:suckhoe   => 'https://vnexpress.net/rss/suc-khoe.rss',
		:congdong  => 'https://vnexpress.net/rss/cong-dong.rss',
		:xe   		 => 'https://vnexpress.net/rss/oto-xe-may.rss',
		:startup 	 => 'https://vnexpress.net/rss/startup.rss',
		:giaitri	 => 'https://vnexpress.net/rss/giai-tri.rss',
		:dulich    => 'https://vnexpress.net/rss/du-lich.rss',
		:kinhte		 => '',
		:vanhoa		 => ''
		}

		@dantri={
		:tintuc   => 'http://dantri.com.vn/trangchu.rss',
		:thoisu   => 'http://dantri.com.vn/xa-hoi.rss',
		:kinhdoanh=> 'http://dantri.com.vn/kinh-doanh.rss',
		:thethao  => 'http://dantri.com.vn/the-thao.rss',
		:thegioi  => 'http://dantri.com.vn/the-gioi.rss',
		:giaoduc  => 'http://dantri.com.vn/giao-duc-khuyen-hoc.rss',
		:congnghe => 'http://dantri.com.vn/suc-manh-so.rss',
		:khoahoc  => 'http://dantri.com.vn/khoa-hoc-cong-nghe.rss',
		:suckhoe	=>	'http://dantri.com.vn/suc-khoe.rss',
		:giaitri	=>	'http://dantri.com.vn/giai-tri.rss',
		:congdong => '',
		:xe				=>	'http://dantri.com.vn/o-to-xe-may.rss',
		:startup 	=> '',
		:vanhoa   => 'http://dantri.com.vn/van-hoa.rss',
		:dulich   => 'http://dantri.com.vn/du-lich.rss',
		:kinhte		=> ''

		}

		@thanhnien={
		:tintuc    => 'https://thanhnien.vn/rss/home.rss',
		:thoisu    => 'https://thanhnien.vn/rss/viet-nam.rss',
		:kinhdoanh => 'https://thanhnien.vn/rss/kinh-te.rss',
		:thethao   => 'https://thethao.thanhnien.vn/rss/home.rss',
		:thegioi   => 'https://thanhnien.vn/rss/the-gioi.rss',
		:giaoduc   => 'https://thanhnien.vn/rss/giao-duc.rss',
		:congnghe  => 'https://thanhnien.vn/rss/cong-nghe-thong-tin.rss',
		:khoahoc   => '',
		:suckhoe   => 'https://thanhnien.vn/rss/doi-song/suc-khoe.rss',
		:doisong   => 'https://thanhnien.vn/rss/doi-song.rss',
		:xe        => 'https://xe.thanhnien.vn/rss/home.rss', 
		:vanhoa    => 'https://thanhnien.vn/rss/van-hoa-nghe-thuat.rss',
		:startup 	=> '',
		:giaitri 	=> '',
		:dulich 	=> '',
		:kinhte 	=> ''
		}


		@nhandan={
		:tintuc    => '',
		:kinhdoanh => '',
		:thoisu    => '',
		:thethao   => 'http://www.nhandan.org.vn/rss/thethao.html',
		:thegioi   => 'http://www.nhandan.org.vn/rss/thegioi.html',
		:giaoduc   => 'http://www.nhandan.org.vn/rss/khoahoc.html',
		:congnghe  => 'http://www.nhandan.org.vn/rss/congnghe.html',
		:khoahoc   => 'http://www.nhandan.org.vn/rss/khoahoc.html',
		:suckhoe   => 'http://www.nhandan.org.vn/rss/suckhoe.html',
		:congdong  => '',
		:xe   		=> '',
		:startup 	=> '',
		:giaitri	=>'',
		:dulich   => '',
		:kinhte   => 'http://www.nhandan.org.vn/rss/kinhte.html',
		:vanhoa    => 'http://www.nhandan.org.vn/rss/vanhoa.html'
		}

		@laodong={
		:tintuc    => 'https://laodong.vn/rss/home.rss',
		:kinhdoanh => '',
		:thoisu    => 'https://laodong.vn/rss/thoi-su.rss',
		:thethao   => 'https://laodong.vn/rss/the-thao.rss',
		:thegioi   => 'https://laodong.vn/rss/the-gioi.rss',
		:giaoduc   => '',
		:congnghe  => 'https://laodong.vn/rss/du-lich.rss',
		:khoahoc   => 'https://laodong.vn/rss/cong-nghe.rss',
		:suckhoe   => 'https://laodong.vn/rss/suc-khoe.rss',
		:congdong  => '',
		:xe   		=> '',
		:startup 	=> '',
		:giaitri	=>'',
		:dulich   => 'https://laodong.vn/rss/du-lich.rss',
		:kinhte   => 'https://laodong.vn/rss/kinh-te.rss',
		:vanhoa    =>'https://laodong.vn/rss/van-hoa-giai-tri.rss'
		}


		@tuoitre={
		:tintuc    => 'https://tuoitre.vn/rss/tin-moi-nhat.rss',
		:kinhdoanh => 'https://tuoitre.vn/rss/kinh-doanh.rss',
		:thoisu    => 'https://tuoitre.vn/rss/thoi-su.rss',
		:thethao   => 'https://tuoitre.vn/rss/the-thao.rss',
		:thegioi   => 'https://tuoitre.vn/rss/the-gioi.rss',
		:giaoduc   => 'https://tuoitre.vn/rss/giao-duc.rss',
		:congnghe  => 'https://tuoitre.vn/rss/nhip-song-so.rss',
		:khoahoc   => 'https://tuoitre.vn/rss/khoa-hoc.rss',
		:suckhoe   => 'https://tuoitre.vn/rss/suc-khoe.rss',
		:congdong  => '',
		:xe   		=> 'https://tuoitre.vn/rss/xe.rss',
		:startup 	=> '',
		:giaitri	=>'https://tuoitre.vn/rss/thu-gian.rss',
		:dulich   => 'https://tuoitre.vn/rss/du-lich.rss',
		:kinhte   => '',
		:vanhoa    => 'https://tuoitre.vn/rss/van-hoa.rss'
		}

		@vtc={
		:tintuc    => 'http://vtc.vn/feed.rss',
		:kinhdoanh => 'http://vtc.vn/doanh-nghiep-doanh-nhan.rss',
		:thoisu    => '',
		:thethao   => 'http://vtc.vn/the-thao.rss',
		:thegioi   => 'http://vtc.vn/the-gioi.rss',
		:giaoduc   => 'https://vtc.vn/giao-duc.rss',
		:congnghe  => 'https://vtc.vn/cong-nghe.rss',
		:khoahoc   => '',
		:suckhoe   => 'https://vtc.vn/suc-khoe-doi-song.rss',
		:congdong  => '',
		:xe   		=> 'https://tuoitre.vn/rss/xe.rss',
		:startup 	=> '',
		:giaitri	=>'https://vtc.vn/giai-tri.rss',
		:dulich   => '',
		:kinhte   => '',
		:vanhoa    => ''
		}
	 	@pages={
		'vnexpress' => @vnexpress,
		'dantri' 		=> @dantri,
		'thanhnien' 	=> @thanhnien,
		'nhandan' 	=> @nhandan,
		'laodong' 	=> @laodong,
		'tuoitre' 	=> @tuoitre,
		'vtc' 			=> @vtc
		}
	end
end
