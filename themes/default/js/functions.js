$(function() {
	$('#navigation ul li:last').addClass('last')
});

$(window).load(function() {
	$('.flexslider').flexslider({
		animation: "slide",
		controlsContainer: ".slider",
		slideshowSpeed: 10000,
		directionNav: false,
		controlNav: false,
		animationDuration: 900
	});
});

$(function(){
    /*if($("#navigation .dropdown-menu li").hasClass('active')){
        $("#navigation dropdown-menu li.active").parent('li').addClass('active');
    }*/
    $("#navigation .dropdown-menu li.active").each(function(){
        $(this).parents('li').addClass('active');
    });
});

function toFixedBigNumber(x) {

	if (Math.abs(x) < 1.0) {
		var e = parseInt(x.toString().split('e-')[1]);
		if (e) {
			x *= Math.pow(10,e-1);
			x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
		}
	} else {
		var e = parseInt(x.toString().split('+')[1]);
		if (e > 20) {
			e -= 20;
			x /= Math.pow(10,e);
			x += (new Array(e+1)).join('0');
		}
	}
	return x;
}


function openKCFinder_audio(obj) {
	window.KCFinder = {};
	window.KCFinder.callBack = function(url) {
		// Actions with url parameter here
		window.KCFinder = null;
		$(obj).val(url);
	};
	//window.open('/asset/ck/browse.php?type=audio', 'audio');

	window.open('/asset/ck/browse.php?type=files&dir=audios',
		'kcfinder_audio', 'status=0, toolbar=0, location=0, menubar=0, ' +
		'directories=0, resizable=1, scrollbars=0, width=800, height=600'
	);

	//var ckFinder = Overlay.panel();
	//ckFinder.open({title:"Audio",width:750,height:530,iframe:true,url:"/asset/ck/browse.php?type=audio"});

}

//function openKCFinder_multipleFiles(obj) {
//	window.KCFinder = {};
//	window.KCFinder.callBackMultiple = function(files) {
//		for (var i; i < files.length; i++) {
//			// Actions with files[i] here
//		}
//		window.KCFinder = null;
//	};
//	window.open('/kcfinder/browse.php', 'kcfinder_multiple');
//}