crawlerTitle=`
  <tr class="tieude" style="background: #5cb85c; color: #fff">
  <th style="text-align: center; width: 35px">
  <strong>STT</strong></th>
  <th style="text-align: center; width: 100px">
  <strong>Trang</strong></th>
  <th style="text-align: center; width: 210px">
  <strong>Tiêu Đề</strong></th>
  <th style="text-align: center; width: 210px">
  <strong>Content</strong></th> 
  <th style="text-align: center; width: 100px">
  <strong>Img</strong></th>
  <th style="text-align: center; width: 100px">
  <strong>Link</strong></th>
  <th style="text-align: center; width: 100px">
  <strong>Thời Gian</strong></th>
  <th style="text-align: center; width: 100px">  
  <strong>Viết bài</strong></th>
  </tr>
`;
img_loading=`  <img src="https://zippy.gfycat.com/SkinnySeveralAsianlion.gif" style="    width: 50px;">`;





$(document).ready(function() {
  //crawler button
  $('#filter').click(function(event){
  $('#loading').html(img_loading);

  pages=getListPages();
  path="/article";
    
  $.ajax({
      method:'GET',
      url: '/craw',
      dataType: "json",
      data: {category:category ,quantity:quantity, pages:pages},
      success:function(data){
        $('#loading').html("");
        drawCrawlerTable(data,path);
      }
    });
  });

  //new Article button

    // ;(function($) {
    //     $(function() {
    //         $('.btn').bind('click', function(e) {
    //             id=$(this).val();
    //             alert(id);
    //     $.ajax({
    //       method:'GET',
    //       url: '/article',
    //       dataType: "json",
    //       data: {id:id},
    //       success:function(data){
    //         alert(data);
    //       }
    //     });
    //         });
    //     });
    // })(jQuery);

});


function article(id)
{
        $.ajax({
          method:'GET',
          url: '/article',
          dataType: "text",
          data: {id:id},
          success:function(data){
          //alert(id);
          }
        });

}

function drawCategory(data) {
alert(data);
//category_post=`
  // <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
  // <a href="" title="`+data['title']+`">
  // <img src="`+data['img']+`" width="300px" height="190"  alt="bến thuyền tràng an">
  // </a>
  // <p class="tieudecon">
  // <b><a href="" title="`+data['title']+`">Khu du lịch sinh thái Tràng An</a></b>
  // </p> 
  // </div>
  // `;
  // alert(category_post);
  // $('#post_category').html(category_post);
  

}



function drawButton(v,path){
 //s=`<button id="article" type="button" value="`+v+`" class="btn" onclick="article(`+v+`)">Đăng</button>`;
//s=`<a value='`+v+`' target="_blank" href="`+path+`">NEW</a>`;
s=`<form action="/article" method="get" target="_blank">
  <input name ='id' value='`+v+`' hidden> 
  <input type="submit" value="Post">
  </form>`;
  return s;
}



function drawCrawlerTable(data,path) {
  $('#crawData').html(crawlerTitle);
  data.forEach(function (i, index) {
  s=`
  <tr style="text-align: center;">
  <td>`+parseInt(index+1)+`</td>
  <td>`+i.page +`</td>
  <td>`+i.title+`</td>
  <td>`+i.content+`</td>
  <td>​ <img src="`+i.img+`" height="80" width="100"> </td>
  <td> <a href="`+i.link+`">Link</a> </td>
  <td>​`+i.date+`</td>
  <td>`+drawButton(index,path)+`</td>`;
  $('#crawData').append(s);
  });
}


function getListPages(){
  pages_Arr=['#vnexpress','#dantri', '#thanhnien','#nhandan','#laodong','#tuoitre','#vtc']
  pages=[];
  category=$('#category').val();
  quantity=$('#quantity').val();

  for (i = 0; i < pages_Arr.length; i++) {
    id=pages_Arr[i];
    if ($(id).is(":checked")) pages.push($(id).val());
  }
    return pages;
}