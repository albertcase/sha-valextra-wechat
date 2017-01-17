var mytipsbox = {
    tipboxobj:null,
    tipboxcontent: function(data) {
var host = window.location.protocol+"//"+window.location.host;
var $val = "";
// $val += '<i class="fa fa-times fa-lg" style="float:right;color:red;margin-bottom:-8px;margin-right:-10px;margin-top:-8px"></i>';
$val += '<div class="tipnews" style="z-index:99">';
$val += '<div>';
$val += '<div>';
$val += '<ul>';
var la = data.length;
for(var i=0; i<la; i++){
  $val += '<li nid="'+data[i]['id']+'" digest="'+data[i]['digest']+'">';
  $val += '<p>'+data[i]['title']+'</p>';
  $val += '<img src="'+host+'/cimg.php?style=w_800&image='+encodeURIComponent(data[i]['thumb_url'])+'">';
  $val += '<a href="javascrpt::void()#" class="tip-newa" onurl="'+data[i]['url']+'">点击添加</a>';
  $val += '</li>';
}
$val += '</ul>';
$val += '</div>';
$val += '</div>';
$val += '</div>';
    this.tipboxobj.html($val);
    this.tipboxobj[0].scrollTop = 0;//select top
    this.tipboxobj.show();
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
          mytipsbox.tipboxobj.hide();
        }
      });
    });
    },
    insertnewsP: null,
    ajaxloadlist: function(){
      var self = this;
      popup.openloading();
      $.ajax({
        url: "/wechat/materiallist",
        type:"post",
        dataType:'json',
        success: function(data){
          popup.closeloading();
          if(data.code == "10"){
            mytipsbox.tipboxcontent(data.list);
          }
          popup.openwarning(data.msg);
        },
        error: function(){
          popup.closeloading();
          popup.openwarning("unknow error");
        }
      });
    },
    selecttipbox: function(){
      var self = this;
      if(this.tipboxobj)
        return this.tipboxobj;
      var $box = '<div class="wehchat-mytips" style="display:none"></div>';
      this.tipboxobj = $($box);
      this.tipboxobj.appendTo("body");
      this.ajaxloadlist();
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
        if (e.wheelDelta) {  //判断浏览器IE，谷歌滑轮事件
          var scroltop = mytipsbox.tipboxobj.children("div").children("div")[0].scrollTop;
          // console.log(mytipsbox.tipboxobj.find("ul")[0].scrollTop);
          console.log(mytipsbox.tipboxobj.find("ul")[0].scrollHeight);
          // console.log(mytipsbox.tipboxobj.children("div").children("div").children("div")[0].scrollTop);
          // console.log(mytipsbox.tipboxobj.children("div").children("div")[0].scrollTop);
            if (e.wheelDelta > 0 && scroltop == 0) { //当滑轮向上滚动时
                var newload = $(mytipsbox.addloadbox());
                mytipsbox.tipboxobj.find("ul").prepend(newload);
            }
        //     if (e.wheelDelta < 0) { //当滑轮向下滚动时
        //         console.log("滑轮向下滚动");
        //     }
        // } else if (e.detail) {  //Firefox滑轮事件
        //     if (e.detail> 0) { //当滑轮向上滚动时
        //         console.log("滑轮向上滚动");
        //     }
        //     if (e.detail< 0) { //当滑轮向下滚动时
        //         console.log("滑轮向下滚动");
        //     }
        }
        e.stopPropagation();
      });
    },
    addloadbox: function(){
var a = "";
a += '<li>';
a += '<i class="fa fa-spinner fa-spin"></i>';
a += '</li>';
return a;
    },
    showtipbox:function(){

    },
    onload: function(){
      var self = this;
      $('#myModal').on("click", ".mytipsboxcs", function(e){
        self.traggletipbox($(this), e);
        mytipsbox.insertnewsP = $(this);
      });
  },
};

$(function(){
  mytipsbox.onload();
});
