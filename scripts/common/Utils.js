	Array.prototype.addItem=function(item){
		this[this.length]=item;
	};

	Array.prototype.indexOf=function(value){
		for (var i=0;i<this.length;i++){
			if (this[i]==value) 
				return i;
		};
		return-1;
	};

	String.prototype.startsWith=function(value){
		return (this.substr(0,value.length)==value);
	};

	String.prototype.endsWith=function(value){
		var L1=this.length;
		var L2=value.length;
		if (L2>L1) return false;
		return (L2==0||this.substr(L1-L2,L2)==value);
	};

	String.prototype.remove=function(start,length){
		var s='';
		if (start>0) 
			s=this.substring(0,start);
		if (start+length<this.length) 
			s+=this.substring(start+length,this.length);
		return s;
	}

	String.prototype.isZipCode=function(){
		return this.search(/\d{5}(-\d{4})?/)!=-1;
	}

	// matches $17.23 or $14,281,545.45 or ...
	String.prototype.isCurrency=function(){
		return this.search(/\$\d{1,3}(,\d{3})*\.\d{2}/)!=-1;
	}

	// matches 5:04 or 12:34 but not 75:83
	String.prototype.isTime=function(){
		return this.search(/^([1-9]|1[0-2]):[0-5]\d$/)!=-1;
	}

	//matches Email Address
	String.prototype.isEmail=function(){
		return this.search(/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/)!=-1;
	}

	// matches phone ###-###-####
	String.prototype.isUSPhone=function(){
		return this.search(/^\(?\d{3}\)?\s|-\d{3}-\d{4}$/)!=-1;
	}

	// matches International Phone Number
	String.prototype.isInternationalPhone=function(){
		return this.search(/^\d(\d|-){7,20}/)!=-1;
	}

	// matches Date yyyy-mm-dd
	String.prototype.isDate=function(){
		var rgx = /(\d{4})-(\d{2})-(\d{2})/;
		return this.match(rgx)
		//return this.search(/^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-./])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/)!=-1;
		//^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$
	}
	// matches IP Address
	String.prototype.isIPAddress=function(){
		return this.search(/^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/)!=-1;
	}

	// matches State Abbreviation
	String.prototype.isState=function(){
		return this.search(/^(AK|AL|AR|AZ|CA|CO|CT|DC|DE|FL|GA|HI|IA|ID|IL|IN|KS|KY|LA|MA|MD|ME|MI|MN|MO|MS|MT|NB|NC|ND|NH|NJ|NM|NV|NY|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VA|VT|WA|WI|WV|WY)$/i)!=-1;
	}

	// matches Social Security Number
	String.prototype.isSSN=function(){
		return this.search(/^\d{3}\-\d{2}\-\d{4}$/)!=-1;
	}

	// matches Visa Credit Card
	String.prototype.isVisaCC=function(){
		return this.search(/^4[0-9]{15}$/)!=-1;
	}

	// matches Mastercard Credit Card
	String.prototype.isMasterCC=function(){
		return this.search(/^5[1-5]{1}[0-9]{14}$/)!=-1;
	}

	// matches Discover Credit Card
	String.prototype.isDiscoverCC=function(){
		return this.search(/^6011[0-9]{12}$/)!=-1;
	}

	// matches AMEX Credit Card
	String.prototype.isAMEXCC=function(){
		return this.search(/^3[47]{1}[0-9]{13}$/)!=-1;
	}

	// matches Credit Card
	String.prototype.isCreditCard=function(){
		return this.search(/^[0-9]{15,16}$/)!=-1;
	}

	// matches Numeric
	String.prototype.isNumeric=function(){
		return this.search(/(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?\.\d\d*$)/)!=-1;
	}

	// matches Integer
	String.prototype.isInteger=function(){
		return this.search(/(^-?\d\d*$)/)!=-1;
	}

	// matches Empty
	String.prototype.isEmpty=function(){
		return this.length==0;
	}

	// rightTrim
	String.prototype.rightTrim=function(){
		return this.replace(/^([\w\W]*)(\b\s*)$/,'$1');
	}

	// leftTrim
	String.prototype.leftTrim=function(){
		return this.replace(/^(\s*)(\b[\w\W]*)$/,'$2');
	}

	// trimAll
	String.prototype.trimAll=function(){
		this.replace(/^(\s*)$/,'');
		return this.replace(/^(\s*)([\W\w]*)(\b\s*$)/,'$2');
	}
	// Validate domain
	String.prototype.isDomainname=function(){
		return this.search(/^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$/)!=-1;
	}

	// Compare string
	String.prototype.equals=function(arg){
		return (this.toString()==arg.toString());
	}


	document.addLoadEvent = function(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		}else{
			window.onload = function() {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}

	var Browser=function(){
		var uAgent=navigator.userAgent.toLowerCase();
		this.isIE=uAgent.indexOf("msie")!=-1;
		this.isGecko=!this.IsIE;
		this.isNetscape=uAgent.indexOf("netscape")!=-1;
		this.platform=navigator.platform;
	}

	function id_check(obj,chk_obj_name){
		if(obj.checked)
			check_all(chk_obj_name);
		else
			check_none(chk_obj_name);
	}
	
	function check_all(chk_obj_name){
		var chk=document.getElementsByName(chk_obj_name);
		var len=chk.length;
		for(var i=0;i<len;i++)
			chk[i].checked=true;
	}

	function check_none(chk_obj_name){
		var chk=document.getElementsByName(chk_obj_name);
		var len=chk.length;
		for(var i=0;i<len;i++)
			chk[i].checked=false;
	}
	
	function delete_selected(chk_obj_name){
		var chk=document.getElementsByName(chk_obj_name);
		var len=chk.length;
		var checked=false;
		for(var i=0;i<len;i++)
			if(chk[i].checked) checked=true;
		if(checked)
			return confirm('Are you sure delete selected items?');
		else
			return true;
	}

	function removeAll(select_obj){
		var len=select_obj.length;
		while(len){
			select_obj.remove(len-1);
			len=select_obj.length;
		}
	}

	function remove(select_obj,index){
		select_obj.remove(index);
	}

	function add(select_obj,text,value){
		nOption=new Option();
		nOption.text=text;
		nOption.value=value;
		len=select_obj.length;
		select_obj.options[len]=nOption;
	}

	function addAll(select_obj,arr_text,arr_value){
		len=select_obj.length;
		vlen=(arr_value.length<arr_text.length)?arr_value.length:arr_text.length;
		for(var i=0;i<vlen;i++){
			nOption=new Option();
			nOption.text=arr_text[i];
			nOption.value=arr_value[i];
			select_obj.options[len+i]=nOption;
		}
	}

	function l2rAll(obj_l,obj_r){
		var len=obj_l.length;
		var arr_value=new Array()
		var arr_text=new Array()
		for(var i=0;i<len;i++){
			arr_value[i]=obj_l.options[i].value;
			arr_text[i]=obj_l.options[i].text;
		}
		removeAll(obj_l);
		addAll(obj_r,arr_text,arr_value);
	}

	function l2r(obj_l,obj_r){
		var len=obj_l.length;
		var arr_index=new Array();
		for(var i=0;i<len;i++){
			if(obj_l.options[i].selected)
				arr_index.push(i);
		}
		len=arr_index.length;
		while(len){
			l=arr_index[len-1]
			value=obj_l.options[l].value;
			text=obj_l.options[l].text;
			remove(obj_l,l);
			add(obj_r,text,value);
			len--;
		}
	}
	
	function getAllValue(select_obj){
		var len=select_obj.length;
		var str_value='';
		while(len){
			value=select_obj.options[len-1].value;
			str_value=str_value+value+'--';
			len--;
		}
		return str_value;
	}

	function getSelectedValue(select_obj){
		var len=select_obj.length;
		var str_value='|';
		while(len){
			if(select_obj.options[len-1].selected){
				value=select_obj.options[len-1].value;
				str_value=str_value+value+'|';
			}
			len--;
		}
		return str_value;
	}

	function isZipCode(string){
		// Check for correct zip code
		return (string.search(/(^\d{5}$)|(^\d{5}-\d{4}$)/) != -1);
		/*reZip = new RegExp(/(^\d{5}$)|(^\d{5}-\d{4}$)/);
		if (!reZip.test(string)) {
			return false;
		}
		return true;*/
	}

	function isEmail(string) {
		return (string.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1);
	}

	function getQueryString(){
		var query = window.location.search.substring(1);
		return query;
	}

	function getQueryVariable(variable) {
		var query = window.location.search.substring(1);
		var vars = query.split("&");
		for (var i=0;i<vars.length;i++) {
			var pair = vars[i].split("=");
			if (pair[0] == variable) {
				return pair[1];
			}
		} 
		return '';
	}

/**
* Delay for a number of milliseconds
*/
function sleep(delay)
{
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}


	function to_day(day){
		var i=parseInt(day);
		switch(i){
			case 0:
				return "SUNDAY";
				break;
			case 1:
				return "MONDAY";
				break;
			case 2:
				return "TUESDAY";
				break;
			case 3:
				return "WEDNESDAY";
				break;
			case 4:
				return "THURSDAY";
				break;
			case 5:
				return "FRIDAY";
				break;
			case 6:
				return "SATURDAY";
				break;
		}
		return "";
	}

	function to_month(mon){
		var i=parseInt(mon);
		switch(i){
			case 0:
				return "JANUARY";
				break;
			case 1:
				return "FEBRUARY";
				break;
			case 2:
				return "MARCH";
				break;
			case 3:
				return "APRIL";
				break;
			case 4:
				return "MAY";
				break;
			case 5:
				return "JUNE";
				break;
			case 6:
				return "JULY";
				break;
			case 7:
				return "AUGUST";
				break;
			case 8:
				return "SEPTEMBER";
				break;
			case 9:
				return "OCTOBER";
				break;
			case 10:
				return "NOVEMBER";
				break;
			case 11:
				return "DECEMBER";
				break;
		}
		return "";
	}

	function isInteger(integer_value) {
		if (integer_value.length == 0)
			return true;

		var decimal_format = ".";
		var check_char;

		check_char = integer_value.indexOf(decimal_format);
		if (check_char < 1)
			return isNumber(object_value);
		else
			return false;
	}

	function isNumber(object_value) {
		if (object_value.length == 0)
			return true;
		
		var start_format = " .+-0123456789";
		var number_format = " .0123456789";
		var check_char;
		var decimal = false;
		var trailing_blank = false;
		var digits = false;
		
		check_char = start_format.indexOf(object_value.charAt(0));
		if (check_char == 1)
			decimal = true;
		else if (check_char < 1)
			return false;
		 
		for (var i = 1; i < object_value.length; i++)	{
			check_char = number_format.indexOf(object_value.charAt(i))
			if (check_char < 0) {
				return false;
			} else if (check_char == 1)	{
				if (decimal)
					return false;
				else
					decimal = true;
			} else if (check_char == 0) {
				if (decimal || digits)	
				trailing_blank = true;
			}	else if (trailing_blank) { 
				return false;
			} else {
				digits = true;
			}
		}	

		return true;
	}

	function numberRange(object_value, min_value, max_value) {
		if (min_value != null) {
			if (object_value < min_value)
				return false;
		}

		if (max_value != null) {
			if (object_value > max_value)
				return false;
		}

		return true;
	}

	function checkRange(object_value, min_value, max_value) {
		if (object_value.length == 0)
			return true;

		if (!isNumber(object_value))
			return false;
		else
			return (numberRange((eval(object_value)), min_value, max_value));	

		return true;
	}

	function checkDay(checkYear, checkMonth, checkDay) {
		maxDay = 31;
		
		if (checkMonth == 4 || checkMonth == 6 ||	checkMonth == 9 || checkMonth == 11) {
			maxDay = 30;
		} else if (checkMonth == 2)	{
			if (checkYear % 4 > 0)
				maxDay =28;
			else if (checkYear % 100 == 0 && checkYear % 400 > 0)
				maxDay = 28;
			else
				maxDay = 29;
		}
		
		return checkRange(checkDay, 1, maxDay); 
	}

	function toUsDate(strDate){
		isplit = strDate.indexOf('/');
		if (isplit == -1)	{
			isplit = strDate.indexOf('-');
		}
		if (isplit == -1 || isplit == strDate.length)
			return false;
		sDay = strDate.substring(0, isplit);
		
		monthSplit = isplit + 1;
		isplit = strDate.indexOf('/', monthSplit);
		if (isplit == -1)	{
			isplit = strDate.indexOf('-', monthSplit);
		}
		if (isplit == -1 ||  (isplit + 1 )  == strDate.length)
			return false;
		sMonth = strDate.substring((sDay.length + 1), isplit);
		
		sYear = strDate.substring(isplit + 1);
		return sMonth + '-' + sDay + '-' + sYear;
	}
	
	function invertDate(strDate){
		isplit = strDate.indexOf('/');
		if (isplit == -1)	{
			isplit = strDate.indexOf('-');
		}
		if (isplit == -1 || isplit == strDate.length)
			return false;
		sDay = strDate.substring(0, isplit);
		
		monthSplit = isplit + 1;
		isplit = strDate.indexOf('/', monthSplit);
		if (isplit == -1)	{
			isplit = strDate.indexOf('-', monthSplit);
		}
		if (isplit == -1 ||  (isplit + 1 )  == strDate.length)
			return false;
		sMonth = strDate.substring((sDay.length + 1), isplit);
		
		sYear = strDate.substring(isplit + 1);
		return sYear + '-' + sMonth + '-' + sDay;
	}
	
	function isDateString(strDate){
		if (strDate.length == 0)
			return true;

		isplit = strDate.indexOf('/');
		if (isplit == -1)	{
			isplit = strDate.indexOf('-');
		}
		if (isplit == -1 || isplit == strDate.length)
			return false;
		sDay = strDate.substring(0, isplit);
		
		monthSplit = isplit + 1;
		isplit = strDate.indexOf('/', monthSplit);
		if (isplit == -1)	{
			isplit = strDate.indexOf('-', monthSplit);
		}
		if (isplit == -1 ||  (isplit + 1 )  == strDate.length)
			return false;
		sMonth = strDate.substring((sDay.length + 1), isplit);
		
		sYear = strDate.substring(isplit + 1);
		
		if (!isInteger(sMonth)) 
			return false;
		else if (!checkRange(sMonth, 1, 12)) 
			return false;
		else if (!isInteger(sYear)) 
			return false;
		else if (!checkRange(sYear, 0, null)) 
			return false;
		else if (!isInteger(sDay)) 
			return false;
		else if (!checkDay(sYear, sMonth, sDay)) 
			return false;
		else
			return true;
	}

	function check_usphone(phonenumber,useareacode){
		if(!useareacode)
			useareacode=1;
		if((phonenumber.match('/^[ ]*[(]{0,1}[ ]*[0-9]{3,3}[ ]*[)]{0,1}[]{0,1}[ ]*[0-9]{3,3}[ ]*[]{0,1}[ ]*[0-9]{4,4}[ ]*$/')==null)
							&&((useareacode!=1)
							&&(phonenumber.match('/^[ ]*[0-9]{3,3}[ ]*[-]{0,1}[ ]*[0-9]{4,4}[ ]*$/')==null)))
			return false;
		return true;
	}

	
	
	jQuery(document).ready(function($) {
		jQuery('#cmdSubmitModuleSearch').click(function(){
			alert('Chức năng chưa hoàn thiện');												
		});	
	}
	)

    function dump(obj) {
        var result = [];
        $.each(obj, function (key, value) { result.push('"' + key + '":"' + value + '"'); });
        return '{' + result.join(',') + '}';
    }

    Encoder = {

	// When encoding do we convert characters into html or numerical entities
	EncodeType : "entity",  // entity OR numerical

	isEmpty : function(val){
		if(val){
			return ((val===null) || val.length==0 || /^\s+$/.test(val));
		}else{
			return true;
		}
	},
	// Convert HTML entities into numerical entities
	HTML2Numerical : function(s){
		var arr1 = new Array('&nbsp;','&iexcl;','&cent;','&pound;','&curren;','&yen;','&brvbar;','&sect;','&uml;','&copy;','&ordf;','&laquo;','&not;','&shy;','&reg;','&macr;','&deg;','&plusmn;','&sup2;','&sup3;','&acute;','&micro;','&para;','&middot;','&cedil;','&sup1;','&ordm;','&raquo;','&frac14;','&frac12;','&frac34;','&iquest;','&agrave;','&aacute;','&acirc;','&atilde;','&Auml;','&aring;','&aelig;','&ccedil;','&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;','&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&Ouml;','&times;','&oslash;','&ugrave;','&uacute;','&ucirc;','&Uuml;','&yacute;','&thorn;','&szlig;','&agrave;','&aacute;','&acirc;','&atilde;','&auml;','&aring;','&aelig;','&ccedil;','&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;','&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&ouml;','&divide;','&Oslash;','&ugrave;','&uacute;','&ucirc;','&uuml;','&yacute;','&thorn;','&yuml;','&quot;','&amp;','&lt;','&gt;','&oelig;','&oelig;','&scaron;','&scaron;','&yuml;','&circ;','&tilde;','&ensp;','&emsp;','&thinsp;','&zwnj;','&zwj;','&lrm;','&rlm;','&ndash;','&mdash;','&lsquo;','&rsquo;','&sbquo;','&ldquo;','&rdquo;','&bdquo;','&dagger;','&dagger;','&permil;','&lsaquo;','&rsaquo;','&euro;','&fnof;','&alpha;','&beta;','&gamma;','&delta;','&epsilon;','&zeta;','&eta;','&theta;','&iota;','&kappa;','&lambda;','&mu;','&nu;','&xi;','&omicron;','&pi;','&rho;','&sigma;','&tau;','&upsilon;','&phi;','&chi;','&psi;','&omega;','&alpha;','&beta;','&gamma;','&delta;','&epsilon;','&zeta;','&eta;','&theta;','&iota;','&kappa;','&lambda;','&mu;','&nu;','&xi;','&omicron;','&pi;','&rho;','&sigmaf;','&sigma;','&tau;','&upsilon;','&phi;','&chi;','&psi;','&omega;','&thetasym;','&upsih;','&piv;','&bull;','&hellip;','&prime;','&prime;','&oline;','&frasl;','&weierp;','&image;','&real;','&trade;','&alefsym;','&larr;','&uarr;','&rarr;','&darr;','&harr;','&crarr;','&larr;','&uarr;','&rarr;','&darr;','&harr;','&forall;','&part;','&exist;','&empty;','&nabla;','&isin;','&notin;','&ni;','&prod;','&sum;','&minus;','&lowast;','&radic;','&prop;','&infin;','&ang;','&and;','&or;','&cap;','&cup;','&int;','&there4;','&sim;','&cong;','&asymp;','&ne;','&equiv;','&le;','&ge;','&sub;','&sup;','&nsub;','&sube;','&supe;','&oplus;','&otimes;','&perp;','&sdot;','&lceil;','&rceil;','&lfloor;','&rfloor;','&lang;','&rang;','&loz;','&spades;','&clubs;','&hearts;','&diams;');
		var arr2 = new Array('&#160;','&#161;','&#162;','&#163;','&#164;','&#165;','&#166;','&#167;','&#168;','&#169;','&#170;','&#171;','&#172;','&#173;','&#174;','&#175;','&#176;','&#177;','&#178;','&#179;','&#180;','&#181;','&#182;','&#183;','&#184;','&#185;','&#186;','&#187;','&#188;','&#189;','&#190;','&#191;','&#192;','&#193;','&#194;','&#195;','&#196;','&#197;','&#198;','&#199;','&#200;','&#201;','&#202;','&#203;','&#204;','&#205;','&#206;','&#207;','&#208;','&#209;','&#210;','&#211;','&#212;','&#213;','&#214;','&#215;','&#216;','&#217;','&#218;','&#219;','&#220;','&#221;','&#222;','&#223;','&#224;','&#225;','&#226;','&#227;','&#228;','&#229;','&#230;','&#231;','&#232;','&#233;','&#234;','&#235;','&#236;','&#237;','&#238;','&#239;','&#240;','&#241;','&#242;','&#243;','&#244;','&#245;','&#246;','&#247;','&#248;','&#249;','&#250;','&#251;','&#252;','&#253;','&#254;','&#255;','&#34;','&#38;','&#60;','&#62;','&#338;','&#339;','&#352;','&#353;','&#376;','&#710;','&#732;','&#8194;','&#8195;','&#8201;','&#8204;','&#8205;','&#8206;','&#8207;','&#8211;','&#8212;','&#8216;','&#8217;','&#8218;','&#8220;','&#8221;','&#8222;','&#8224;','&#8225;','&#8240;','&#8249;','&#8250;','&#8364;','&#402;','&#913;','&#914;','&#915;','&#916;','&#917;','&#918;','&#919;','&#920;','&#921;','&#922;','&#923;','&#924;','&#925;','&#926;','&#927;','&#928;','&#929;','&#931;','&#932;','&#933;','&#934;','&#935;','&#936;','&#937;','&#945;','&#946;','&#947;','&#948;','&#949;','&#950;','&#951;','&#952;','&#953;','&#954;','&#955;','&#956;','&#957;','&#958;','&#959;','&#960;','&#961;','&#962;','&#963;','&#964;','&#965;','&#966;','&#967;','&#968;','&#969;','&#977;','&#978;','&#982;','&#8226;','&#8230;','&#8242;','&#8243;','&#8254;','&#8260;','&#8472;','&#8465;','&#8476;','&#8482;','&#8501;','&#8592;','&#8593;','&#8594;','&#8595;','&#8596;','&#8629;','&#8656;','&#8657;','&#8658;','&#8659;','&#8660;','&#8704;','&#8706;','&#8707;','&#8709;','&#8711;','&#8712;','&#8713;','&#8715;','&#8719;','&#8721;','&#8722;','&#8727;','&#8730;','&#8733;','&#8734;','&#8736;','&#8743;','&#8744;','&#8745;','&#8746;','&#8747;','&#8756;','&#8764;','&#8773;','&#8776;','&#8800;','&#8801;','&#8804;','&#8805;','&#8834;','&#8835;','&#8836;','&#8838;','&#8839;','&#8853;','&#8855;','&#8869;','&#8901;','&#8968;','&#8969;','&#8970;','&#8971;','&#9001;','&#9002;','&#9674;','&#9824;','&#9827;','&#9829;','&#9830;');
		return this.swapArrayVals(s,arr1,arr2);
	},	

	// Convert Numerical entities into HTML entities
	NumericalToHTML : function(s){
		var arr1 = new Array('&#160;','&#161;','&#162;','&#163;','&#164;','&#165;','&#166;','&#167;','&#168;','&#169;','&#170;','&#171;','&#172;','&#173;','&#174;','&#175;','&#176;','&#177;','&#178;','&#179;','&#180;','&#181;','&#182;','&#183;','&#184;','&#185;','&#186;','&#187;','&#188;','&#189;','&#190;','&#191;','&#192;','&#193;','&#194;','&#195;','&#196;','&#197;','&#198;','&#199;','&#200;','&#201;','&#202;','&#203;','&#204;','&#205;','&#206;','&#207;','&#208;','&#209;','&#210;','&#211;','&#212;','&#213;','&#214;','&#215;','&#216;','&#217;','&#218;','&#219;','&#220;','&#221;','&#222;','&#223;','&#224;','&#225;','&#226;','&#227;','&#228;','&#229;','&#230;','&#231;','&#232;','&#233;','&#234;','&#235;','&#236;','&#237;','&#238;','&#239;','&#240;','&#241;','&#242;','&#243;','&#244;','&#245;','&#246;','&#247;','&#248;','&#249;','&#250;','&#251;','&#252;','&#253;','&#254;','&#255;','&#34;','&#38;','&#60;','&#62;','&#338;','&#339;','&#352;','&#353;','&#376;','&#710;','&#732;','&#8194;','&#8195;','&#8201;','&#8204;','&#8205;','&#8206;','&#8207;','&#8211;','&#8212;','&#8216;','&#8217;','&#8218;','&#8220;','&#8221;','&#8222;','&#8224;','&#8225;','&#8240;','&#8249;','&#8250;','&#8364;','&#402;','&#913;','&#914;','&#915;','&#916;','&#917;','&#918;','&#919;','&#920;','&#921;','&#922;','&#923;','&#924;','&#925;','&#926;','&#927;','&#928;','&#929;','&#931;','&#932;','&#933;','&#934;','&#935;','&#936;','&#937;','&#945;','&#946;','&#947;','&#948;','&#949;','&#950;','&#951;','&#952;','&#953;','&#954;','&#955;','&#956;','&#957;','&#958;','&#959;','&#960;','&#961;','&#962;','&#963;','&#964;','&#965;','&#966;','&#967;','&#968;','&#969;','&#977;','&#978;','&#982;','&#8226;','&#8230;','&#8242;','&#8243;','&#8254;','&#8260;','&#8472;','&#8465;','&#8476;','&#8482;','&#8501;','&#8592;','&#8593;','&#8594;','&#8595;','&#8596;','&#8629;','&#8656;','&#8657;','&#8658;','&#8659;','&#8660;','&#8704;','&#8706;','&#8707;','&#8709;','&#8711;','&#8712;','&#8713;','&#8715;','&#8719;','&#8721;','&#8722;','&#8727;','&#8730;','&#8733;','&#8734;','&#8736;','&#8743;','&#8744;','&#8745;','&#8746;','&#8747;','&#8756;','&#8764;','&#8773;','&#8776;','&#8800;','&#8801;','&#8804;','&#8805;','&#8834;','&#8835;','&#8836;','&#8838;','&#8839;','&#8853;','&#8855;','&#8869;','&#8901;','&#8968;','&#8969;','&#8970;','&#8971;','&#9001;','&#9002;','&#9674;','&#9824;','&#9827;','&#9829;','&#9830;');
		var arr2 = new Array('&nbsp;','&iexcl;','&cent;','&pound;','&curren;','&yen;','&brvbar;','&sect;','&uml;','&copy;','&ordf;','&laquo;','&not;','&shy;','&reg;','&macr;','&deg;','&plusmn;','&sup2;','&sup3;','&acute;','&micro;','&para;','&middot;','&cedil;','&sup1;','&ordm;','&raquo;','&frac14;','&frac12;','&frac34;','&iquest;','&agrave;','&aacute;','&acirc;','&atilde;','&Auml;','&aring;','&aelig;','&ccedil;','&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;','&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&Ouml;','&times;','&oslash;','&ugrave;','&uacute;','&ucirc;','&Uuml;','&yacute;','&thorn;','&szlig;','&agrave;','&aacute;','&acirc;','&atilde;','&auml;','&aring;','&aelig;','&ccedil;','&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;','&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&ouml;','&divide;','&Oslash;','&ugrave;','&uacute;','&ucirc;','&uuml;','&yacute;','&thorn;','&yuml;','&quot;','&amp;','&lt;','&gt;','&oelig;','&oelig;','&scaron;','&scaron;','&yuml;','&circ;','&tilde;','&ensp;','&emsp;','&thinsp;','&zwnj;','&zwj;','&lrm;','&rlm;','&ndash;','&mdash;','&lsquo;','&rsquo;','&sbquo;','&ldquo;','&rdquo;','&bdquo;','&dagger;','&dagger;','&permil;','&lsaquo;','&rsaquo;','&euro;','&fnof;','&alpha;','&beta;','&gamma;','&delta;','&epsilon;','&zeta;','&eta;','&theta;','&iota;','&kappa;','&lambda;','&mu;','&nu;','&xi;','&omicron;','&pi;','&rho;','&sigma;','&tau;','&upsilon;','&phi;','&chi;','&psi;','&omega;','&alpha;','&beta;','&gamma;','&delta;','&epsilon;','&zeta;','&eta;','&theta;','&iota;','&kappa;','&lambda;','&mu;','&nu;','&xi;','&omicron;','&pi;','&rho;','&sigmaf;','&sigma;','&tau;','&upsilon;','&phi;','&chi;','&psi;','&omega;','&thetasym;','&upsih;','&piv;','&bull;','&hellip;','&prime;','&prime;','&oline;','&frasl;','&weierp;','&image;','&real;','&trade;','&alefsym;','&larr;','&uarr;','&rarr;','&darr;','&harr;','&crarr;','&larr;','&uarr;','&rarr;','&darr;','&harr;','&forall;','&part;','&exist;','&empty;','&nabla;','&isin;','&notin;','&ni;','&prod;','&sum;','&minus;','&lowast;','&radic;','&prop;','&infin;','&ang;','&and;','&or;','&cap;','&cup;','&int;','&there4;','&sim;','&cong;','&asymp;','&ne;','&equiv;','&le;','&ge;','&sub;','&sup;','&nsub;','&sube;','&supe;','&oplus;','&otimes;','&perp;','&sdot;','&lceil;','&rceil;','&lfloor;','&rfloor;','&lang;','&rang;','&loz;','&spades;','&clubs;','&hearts;','&diams;');
		return this.swapArrayVals(s,arr1,arr2);
	},


	// Numerically encodes all unicode characters
	numEncode : function(s){
		
		if(this.isEmpty(s)) return "";

		var e = "";
		for (var i = 0; i < s.length; i++)
		{
			var c = s.charAt(i);
			if (c < " " || c > "~")
			{
				c = "&#" + c.charCodeAt() + ";";
			}
			e += c;
		}
		return e;
	},
	
	// HTML Decode numerical and HTML entities back to original values
	htmlDecode : function(s){

		var c,m,d = s;
		
		if(this.isEmpty(d)) return "";

		// convert HTML entites back to numerical entites first
		d = this.HTML2Numerical(d);
		
		// look for numerical entities &#34;
		arr=d.match(/&#[0-9]{1,5};/g);
		
		// if no matches found in string then skip
		if(arr!=null){
			for(var x=0;x<arr.length;x++){
				m = arr[x];
				c = m.substring(2,m.length-1); //get numeric part which is refernce to unicode character
				// if its a valid number we can decode
				if(c >= -32768 && c <= 65535){
					// decode every single match within string
					d = d.replace(m, String.fromCharCode(c));
				}else{
					d = d.replace(m, ""); //invalid so replace with nada
				}
			}			
		}

		return d;
	},		

	// encode an input string into either numerical or HTML entities
	htmlEncode : function(s,dbl){
			
		if(this.isEmpty(s)) return "";

		// do we allow double encoding? E.g will &amp; be turned into &amp;amp;
		dbl = dbl | false; //default to prevent double encoding
		
		// if allowing double encoding we do ampersands first
		if(dbl){
			if(this.EncodeType=="numerical"){
				s = s.replace(/&/g, "&#38;");
			}else{
				s = s.replace(/&/g, "&amp;");
			}
		}

		// convert the xss chars to numerical entities ' " < >
		s = this.XSSEncode(s,false);
		
		if(this.EncodeType=="numerical" || !dbl){
			// Now call function that will convert any HTML entities to numerical codes
			s = this.HTML2Numerical(s);
		}

		// Now encode all chars above 127 e.g unicode
		s = this.numEncode(s);

		// now we know anything that needs to be encoded has been converted to numerical entities we
		// can encode any ampersands & that are not part of encoded entities
		// to handle the fact that I need to do a negative check and handle multiple ampersands &&&
		// I am going to use a placeholder

		// if we don't want double encoded entities we ignore the & in existing entities
		if(!dbl){
			s = s.replace(/&#/g,"##AMPHASH##");
		
			if(this.EncodeType=="numerical"){
				s = s.replace(/&/g, "&#38;");
			}else{
				s = s.replace(/&/g, "&amp;");
			}

			s = s.replace(/##AMPHASH##/g,"&#");
		}
		
		// replace any malformed entities
		s = s.replace(/&#\d*([^\d;]|$)/g, "$1");

		if(!dbl){
			// safety check to correct any double encoded &amp;
			s = this.correctEncoding(s);
		}

		// now do we need to convert our numerical encoded string into entities
		if(this.EncodeType=="entity"){
			s = this.NumericalToHTML(s);
		}

		return s;					
	},

	// Encodes the basic 4 characters used to malform HTML in XSS hacks
	XSSEncode : function(s,en){
		if(!this.isEmpty(s)){
			en = en || true;
			// do we convert to numerical or html entity?
			if(en){
				s = s.replace(/\'/g,"&#39;"); //no HTML equivalent as &apos is not cross browser supported
				s = s.replace(/\"/g,"&quot;");
				s = s.replace(/</g,"&lt;");
				s = s.replace(/>/g,"&gt;");
			}else{
				s = s.replace(/\'/g,"&#39;"); //no HTML equivalent as &apos is not cross browser supported
				s = s.replace(/\"/g,"&#34;");
				s = s.replace(/</g,"&#60;");
				s = s.replace(/>/g,"&#62;");
			}
			return s;
		}else{
			return "";
		}
	},

	// returns true if a string contains html or numerical encoded entities
	hasEncoded : function(s){
		if(/&#[0-9]{1,5};/g.test(s)){
			return true;
		}else if(/&[A-Z]{2,6};/gi.test(s)){
			return true;
		}else{
			return false;
		}
	},

	// will remove any unicode characters
	stripUnicode : function(s){
		return s.replace(/[^\x20-\x7E]/g,"");
		
	},

	// corrects any double encoded &amp; entities e.g &amp;amp;
	correctEncoding : function(s){
		return s.replace(/(&amp;)(amp;)+/,"$1");
	},


	// Function to loop through an array swaping each item with the value from another array e.g swap HTML entities with Numericals
	swapArrayVals : function(s,arr1,arr2){
		if(this.isEmpty(s)) return "";
		var re;
		if(arr1 && arr2){
			//ShowDebug("in swapArrayVals arr1.length = " + arr1.length + " arr2.length = " + arr2.length)
			// array lengths must match
			if(arr1.length == arr2.length){
				for(var x=0,i=arr1.length;x<i;x++){
					re = new RegExp(arr1[x], 'g');
					s = s.replace(re,arr2[x]); //swap arr1 item with matching item from arr2	
				}
			}
		}
		return s;
	},

	inArray : function( item, arr ) {
		for ( var i = 0, x = arr.length; i < x; i++ ){
			if ( arr[i] === item ){
				return i;
			}
		}
		return -1;
	}
}


function findSWF(movieName) {
    if (navigator.appName.indexOf("Microsoft")!= -1) {
        return window[movieName];
    } else {
        return document[movieName];
    }
}

function executerRegistry(callback, timeout){
    var callbacks = jQuery.data(document.body, 'EvnExecuterCallbacks');
    if(jQuery.isArray(callbacks)){
        callbacks.addItem(callback);
    }else{
        callbacks = [callback];
    }
    jQuery.data(document.body, 'EvnExecuterCallbacks', callbacks);

    jQuery.data(document.body, 'EvnExecuterTimeout' + callback, timeout);
    jQuery.data(document.body, 'EvnExecuterActive' + callback, true);
}

function executerActive(callback){
    jQuery.data(document.body, 'EvnExecuterActive' + callback, true);
}

function executerInActive(callback){
    jQuery.data(document.body, 'EvnExecuterActive' + callback, false);
}

function executerClearTimer(){
    var timers = jQuery.data(document.body, 'EvnExecuterTimers');
    if(jQuery.isArray(timers)){
        jQuery.each(timers, function(index, timer){
            clearInterval(timer);
        });
    }
    jQuery.removeData(document.body, 'EvnExecuterRuns');
    jQuery.removeData(document.body, 'EvnExecuterTimers');
}

function executerClearAll(){
    executerClearTimer();
    var callbacks = jQuery.data(document.body, 'EvnExecuterCallbacks');
    if(jQuery.isArray(callbacks)){
        jQuery.each(callbacks, function(index, callback){
            jQuery.removeData(document.body, "EvnExecuterTimeout" + callback);
            jQuery.removeData(document.body, "EvnExecuterActive" + callback);
        });
    }
    jQuery.removeData(document.body, "EvnExecuterCallbacks");
}


function executerProcess(){
    var callbacks = jQuery.data(document.body, 'EvnExecuterCallbacks');
    if(jQuery.isArray(callbacks)){
        jQuery.each(callbacks, function(index, callback){
            var active = jQuery.data(document.body, 'EvnExecuterActive' + callback);
            var timeout = jQuery.data(document.body, 'EvnExecuterTimeout' + callback);
            if(active == true){
                var runs = jQuery.data(document.body, 'EvnExecuterRuns');
                if(!jQuery.isArray(runs)){
                    runs = [];
                }

                var timers = jQuery.data(document.body, 'EvnExecuterTimers');
                if(!jQuery.isArray(timers)){
                    timers = [];
                }

                if(jQuery.inArray(callback, runs) == -1){
                    var timer = setInterval(callback, timeout);
                    runs.addItem(callback);
			        timers.addItem(timer);
                }
                jQuery.data(document.body, 'EvnExecuterRuns', runs);
                jQuery.data(document.body, 'EvnExecuterTimers', timers);
            }
        });
    }
}

function leftMenuControll(obj){
	panel = jQuery(obj);
	if(panel.hasClass('hiddenPanel')){
		panel.removeClass('hiddenPanel');	
	}else{
		panel.addClass('hiddenPanel');
	}
	resizeGridWrap();
}

function resizeGridWrap(){
	try{
		
		var flag = jQuery('#PanelBarWrap').hasClass('hiddenPanel');
		if(flag) w = $(window).width() - 130;
		else w = $(window).width() - 290;
		jQuery('.gridWrap').width(w);
	}catch(e){
		//alert(e.toString());
	}
}

var AjaxRequest = function(opts){
    return function() {
		function createRequest() {
		    if (window.ActiveXObject) {
			    return new window.ActiveXObject("Microsoft.XMLHTTP");
		    } else {
			    return new window.XMLHttpRequest() || null;
		    }
		}
    }
}

function isIE()
{
	return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent);
}

jQuery(document).ready(function(){resizeGridWrap();});

jQuery(window).bind('resize', function() {
    resizeGridWrap();
});

jQuery(window).bind('load', function() {
    resizeGridWrap();
});