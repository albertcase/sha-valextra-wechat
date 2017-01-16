var mytipsbox = {
    tipboxobj:null,
    tipboxcontent: function() {
var $val = "";
// $val += '<i class="fa fa-times fa-lg" style="float:right;color:red;margin-bottom:-8px;margin-right:-10px;margin-top:-8px"></i>';
$val += '<div class="tipnews" style="z-index:99">';
$val += '<div>';
$val += '<div>';
$val += '<ul>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" class="tip-newa">点击添加</a>';
$val += '</li>';

$val += '<li>';
$val += '<p>范冰冰巴黎秀场日记</p>';
$val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
$val += '<a href="javascrpt::void()#" onurl="#" class="tip-newa">点击添加</a>';
$val += '</li>';


$val += '</ul>';
$val += '</div>';
$val += '</div>';
$val += '</div>';
    this.tipboxobj.html($val);
    this.tipboxobj.find(".tip-newa").each(function(){
      $(this).click(function(){
        if(mytipsbox.insertnewsP){
          var obj = $(this).parent();
          var data = {
            Title: obj.children("p").text(),
            Description: obj.attr("digest"),
            Url: obj.children("a").attr("onurl"),
            PicUrl: obj.children("img").attr("src"),
          };
          mytipsbox.insertnewsP.after(htmlconetnt.loadpushmessage(data));
          mytipsbox.insertnewsP.prev().remove();
          mytipsbox.insertnewsP.remove();
        }
      });
    });
    },
    insertnewsP: null,
    scrolloutoftipbox: function(){
      var hidetipbox = function(){
        mytipsbox.tipboxobj.tipso('hide',true);
        document.removeEventListener('scroll', hidetipbox);
      };
      document.addEventListener('scroll', hidetipbox);
    },
    addtipboxlisten: function(){
      console.log(mytipsbox.tipboxobj.Plugin);
    },
    selecttipbox: function(){
      var self = this;
      if(this.tipboxobj)
        return this.tipboxobj;
      var $box = '<div class="wehchat-mytips" style="display:none"></div>';
      this.tipboxobj = $($box);
      this.tipboxobj.appendTo("body");
      return this.tipboxobj;
    },
    traggletipbox: function(obj, e){
      var self = this;
      self.selecttipbox();
      var L = obj.offset().left;
      var T = obj.offset().top;
      var BT = T-300;
      var BL = L+80;
      if(BT<0)
        BT = 0;
      if((document.body.offsetHeight - 450) < BT)
        BT = document.body.offsetHeight - 450;
      this.tipboxobj.css({
        top: BT+"px",
        left: BL+"px",
      });
      this.tipboxobj.toggle();
      clearTimeout(self.autoclose);
      self.autoclose = setTimeout(function(){
        self.tipboxobj.hide();
      },2000);
      self.addlistener();
    },
    autoclose: null,
    addlistener: function(){
      var self = this;
      self.tipboxobj[0].addEventListener('mouseenter', function(){
        self.tipboxobj[0].addEventListener('mouseleave', function(e){
          // mytipsbox.tipboxobj.hide();
        });
        clearTimeout(self.autoclose);
      });
      var hidetipbox = function(){
        mytipsbox.tipboxobj.hide();
        document.removeEventListener('wheel', hidetipbox);
      };
      document.addEventListener('wheel', hidetipbox);
      self.tipboxobj[0].addEventListener('wheel', function(e){
        e.stopPropagation();
      });
    },
    showtipbox:function(){

    },
    onload: function(){
      var self = this;
      $('#myModal').on("click", ".mytipsboxcs", function(e){
        // self.tipboxclick($(this), e);
        self.selecttipbox();
        self.tipboxcontent();
        self.traggletipbox($(this), e);
        mytipsbox.insertnewsP = $(this);
      });
  },
};

$(function(){
  mytipsbox.onload();
});
