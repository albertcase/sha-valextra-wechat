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
    this.traggletipbox(mytipsbox.insertnewsP);
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
      if(this.tipboxobj){
        self.traggletipbox(mytipsbox.insertnewsP);
        return this.tipboxobj;
      }
      var $box = '<div class="wehchat-mytips" style="display:none"></div>';
      this.tipboxobj = $($box);
      this.tipboxobj.appendTo("body");
      this.ajaxloadlist();
      return this.tipboxobj;
    },
    traggletipbox: function(obj){
      var self = this;
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
    ajaxgetnewtip: function(id, order, obj){
      var self = this;
      $.ajax({
        url: "/wechat/materiallist",
        type:"post",
        dataType:'json',
        data:{
          id: id,
          order: order
        },
        controlobj: obj,
        success: function(data){
          if(data.code == "10"){
            mytipsbox.insertnewsli(data.list, this.controlobj);
          }
          popup.openwarning(data.msg);
        },
        error: function(){
          popup.openwarning("unknow error");
          this.controlobj.slideUp('show', 'linear', function(){
            $(this).remove();
          });
        }
      });
    },
    insertnewsli: function(data, obj){
      var host = window.location.protocol+"//"+window.location.host;
      var la = data.length;
      if(la>0)
        obj.hide();
      for(var i=0; i<la; i++){
        $val = '<li nid="'+data[i]['id']+'" digest="'+data[i]['digest']+'">';
        $val += '<p>'+data[i]['title']+'</p>';
        $val += '<img src="'+host+'/cimg.php?style=w_800&image='+encodeURIComponent(data[i]['thumb_url'])+'">';
        $val += '<a href="javascrpt::void()#" class="tip-newa" onurl="'+data[i]['url']+'">点击添加</a>';
        $val += '</li>';
        var nli = $($val);
        nli.click(function(){
          if(mytipsbox.insertnewsP){
            var obj = $(this);
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
        obj.before(nli);
      }
      obj.slideUp('show', 'linear', function(){
        $(this).remove();
      });
    },
    addlistener: function(){
      var self = this;
      self.tipboxobj[0].addEventListener('mouseenter', function(){
        self.tipboxobj[0].addEventListener('mouseleave', function(e){
          clearTimeout(mytipsbox.autoclose);
          mytipsbox.autoclose = setTimeout(function(){
            mytipsbox.tipboxobj.hide();
          },1000);
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
          var scrolheight = mytipsbox.tipboxobj.children("div").children("div")[0].scrollHeight-mytipsbox.tipboxobj.children("div").children("div")[0].offsetHeight;
            if (e.wheelDelta > 0 && scroltop == 0) { //当滑轮向上滚动时
              if(!mytipsbox.tipboxobj.find("ul>li").eq(0).is(".tiploading")){
                var newload = $(mytipsbox.addloadbox());
                mytipsbox.ajaxgetnewtip(mytipsbox.tipboxobj.find("ul>li").eq(0).attr("nid"), 'top', newload);
                mytipsbox.tipboxobj.find("ul").prepend(newload);
                newload.slideDown();
              }
            }
            if (e.wheelDelta < 0 && scroltop == scrolheight) { //当滑轮向下滚动时
              if(!mytipsbox.tipboxobj.find("ul>li").last().is(".tiploading")){
                var newload = $(mytipsbox.addloadbox());
                mytipsbox.ajaxgetnewtip(mytipsbox.tipboxobj.find("ul>li").last().attr("nid"), 'bottom', newload);
                mytipsbox.tipboxobj.find("ul").append(newload);
                newload.slideDown();
              }
            }
        } else if (e.detail) {  //Firefox滑轮事件
            if (e.detail> 0) { //当滑轮向上滚动时
                console.log("滑轮向上滚动");
            }
            if (e.detail< 0) { //当滑轮向下滚动时
                console.log("滑轮向下滚动");
            }
        }
        e.stopPropagation();
      });
      self.tipboxobj[0].addEventListener('scroll', function(e){
        e.stopPropagation();
        e.preventDefault();
      });
    },
    addloadbox: function(){
var a = "";
a += '<li class="tiploading" style="display:none">';
a += '<i class="fa fa-spinner fa-spin"></i>';
a += '</li>';
return a;
    },
    onload: function(){
  },
};

$(function(){
  mytipsbox.onload();
});
