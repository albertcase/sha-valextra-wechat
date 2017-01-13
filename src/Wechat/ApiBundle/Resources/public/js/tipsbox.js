var mytipsbox = {
  onload: function(){
    $('.mytipsboxcs').on({
      click: function(e) {
        var $box = $(this).children("span").eq(0);
        if($(this).is(".tipsshow")){
          $box.tipso('hide',true);
          $(this).removeClass("tipsshow");
          return true;
        }
        $box.tipso({
        useTitle: false,
        position: 'right',
        background: "#282828",
        width: "330px",
        offsetX: 10,
      });
        var $val = "";
    $val += '<div class="tipnews">';
    $val += '<div>';
    $val += '<div>';
    $val += '<ul>';

    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';

    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';

    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';

    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';
    $val += '<li>';
    $val += '<p>范冰冰巴黎秀场日记</p>';
    $val += '<img src="/cimg.php?style=w_400&amp;image=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FO2UicZ5bnsbIT8U4jjicuRQGDlfogH5QBZsF6ESaaTLfEOB6oFQibsqwXFUxPUP4ZQytOW8VsA0o7gR6ptBicDPvxw%2F0%3Fwx_fmt%3Djpeg">';
    $val += '<a href="http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&amp;mid=505470592&amp;idx=2&amp;sn=eabfc0a919f0f82112406ac5d011da53&amp;chksm=0b2a35563c5dbc4014fcd2d2ec9d4e3374cccb82416ff3ed6006499c7b75855377220e811f7f#rd" target="_blank">点击预览</a>';
    $val += '</li>';

    $val += '</ul>';
    $val += '</div>';
    $val += '</div>';
    $val += '</div>';
        $box.tipso('update', 'content', $val);
        $box.tipso('show',true);
        $(this).addClass("tipsshow");
        e.preventDefault();
      }
    });
  },
};

$(function(){
  mytipsbox.onload();
});
