$(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
          $('.jscroll').jscroll({
            contentSelector: '.inline-block-post',
            nextSelector: 'span.next:last a'
          });
    }
});
$(function(){
  $('.slider').slick({
      autoplay:true,
      autoplaySpeed:1000,
      dots:true,
      arrows:false,
      fade:true,
      speed:2900,
  });
});
