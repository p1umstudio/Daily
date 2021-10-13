/*
고객센터 상단 바 고정 
 */

$(function() {
	$(window).scroll(function() {
		// 상단 servicebar 고정 
		if ($(this).scrollTop() > 0) {
			$('.servicebar ').css({
				'position': 'fixed',
				'top': '0'
			});

			$('.servicebar').show();
		}// bar고정

	})// window scroll	 	


}); // ready
