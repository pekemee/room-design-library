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
