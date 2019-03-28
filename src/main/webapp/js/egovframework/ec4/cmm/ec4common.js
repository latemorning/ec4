/**
 * ec4 common
 */

	// Datatable lang Korean
	var lang_kor = {
	    "decimal" : "",
	    "emptyTable" : "데이터가 없습니다.",
	    "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
	    "infoEmpty" : "0건",
	    "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
	    "infoPostFix" : "",
	    "thousands" : ",",
	    "lengthMenu" : "_MENU_ 개씩 보기",
	    "loadingRecords" : "로딩중...",
	    "processing" : "처리중...",
	    "search" : "검색 : ",
	    "zeroRecords" : "검색된 데이터가 없습니다.",
	    "paginate" : {
	        "first" : "<<",
	        "last" : ">>",
	        "next" : ">",
	        "previous" : "<"
	    },
	    "aria" : {
	        "sortAscending" : " :  오름차순 정렬",
	        "sortDescending" : " :  내림차순 정렬"
	    },
	    select: {
            rows: {
                _: "%d개 행이 선택됨",
                0: "",
                1: "1개 행이 선택됨"
            }
        }
	};


    /**
     * popup 공통
     * 2018.05.16 harry
     */
    function fn_open_popup(popupParams) {

        popupParams.top = (window.screen.height - popupParams.width) / 3;
        popupParams.left = (window.screen.width - popupParams.height) / 2;
        if (popupParams.top < 0){popupParams.top = 0;}
        if (popupParams.left < 0){popupParams.left = 0;}
        popupParams.future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,left=" + popupParams.left + ",top=" + popupParams.top + ",width=" + popupParams.width + ",height=" + popupParams.height;

        popupWindow = window.open("", popupParams.title, popupParams.future);

        popupParams.form.submit();

        popupWindow.focus();
    }


	/**모달 팝업 닫기*/
	function close_modal(){
		parent.$('#modal_popup_close').trigger('click');
	}


	// 새창
	var win = "";
	function NewWindow(mypage, myname, w, h, scroll, resize) {
		var winl = (screen.width - w) / 2;
		var wint = (screen.height - h) / 2 - 35;
		var winRe = resize ? 'yes' : 'no';
		var winprops = 'height=' + h + ',width=' + w + ',top=' + wint + ',left='
				+ winl + ',scrollbars=' + scroll + ',resizable=' + winRe
				+ ',status=yes, menubar=no, toolbar=no,location=no';


		win = window.open(encodeURI(mypage), myname, winprops);
		try{
		    win.focus();
		}catch(e){
		    alert("팝업차단을 해제해주세요.");
		}

		// return win;
	}

	var gd = new Date();
	var gID = gd.getDate()+""+gd.getMonth() + 1+""+gd.getFullYear()+""+gd.getHours()+""+gd.getMinutes()+""+gd.getSeconds();
	function pop_winmodal(mypage, myname, w, h, scroll, resize){
		var height = h+"px";
		var width = w+"px";
		var left = (screen.availWidth - width)/2;
		var top = (screen.availHeight - height)/2;
		if (window.showModalDialog)
		{
			var dialogArguments = new Object();
			var _R = window.showModalDialog(mypage, myname, "dialogWidth="+width+";dialogHeight="+height+";scroll="+scroll+";status=no;");
			if ("undefined" != typeof(_R))
			{
				SetName(_R.strName);
			}
		}
		else	//NS
		{
			var left = (screen.width-width)/2;
			var top = (screen.height-height)/2;
	 		winHandle = window.open(mypage, gID, "modal,toolbar=false,location=false,directories=false,status=false,menubar=false,scrollbars=no,resizable=no,left="+left+",top="+top+",width="+width+",height="+height);
			winHandle.focus();
		}
		return false;
	}


    /**
     * 전화번호 format
     * 2018.08.17 harry...
     */
    function fn_format_telno(param){

    	return param.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]*)([0-9]{4})/, "$1-$2-$3");
    }



	//■ typeof 연산자를 이용한 빈값 체크
	function isEmpty(str) {
	    if (typeof str == "undefined" || str == null || str == "" || str == "null" || str == undefined) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	//※ typeof는 "number","string","boolean","object","function","undefined"의 6가지 값을 반환

	//■ 값이 비었을 때, default 문자열로 치환
	  function nvl(str, defaultStr) {
	    if (typeof str == "undefined" || str == null || str == "" || str == "null" || str == undefined) {
	      str = defaultStr;
	    }
	    return str;
	  }

	  //■ 비교값을 이용한 문자열 치환
	  function changeStr(str, compareStr, defaultStr, changeStr) {
	    if (str == compareStr) {
	      str = defaultStr;
	    } else {
	      str = changeStr;
	    }
	    return str;
	  }

	  /**
	   * 소문자를 대문자로 onkeyup="doUpper(this)"
	   */
	  function doUpper(obj) {
	  	obj.value = obj.value.toUpperCase();
	  	return obj.value
	  }


	  /*
	   * 이메일 유효성 체크
	   * */
	  function fn_chk_email(email) {
	  	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

	  	if(regex.test(email) === false) {
	  	    return false;
	  	} else {
	  		return true;
	  	}
	  }


	  /*
	   * 숫자와 한글 그리고 영문을 체크하는 함수..
	   * */
	  function chkStr(objName, sep){

		var rtnTxt = $(objName).val();

	  	if(sep == "no"){ // 숫자만 입력되어야 하는 경우
	  		var pattern = /[^(0-9)]/gi;   // 숫자
	  		for(i=0;i< $(objName).val().length;i++){
	  			var code = $(objName).val().charCodeAt(i);
	  			//var ch = a[objName].value.substr(i,1).toUpperCase()
	  			code = parseInt(code);

	  			if(code >= 48 && code <= 57){ //숫자인 경우
	  			}else{
	  				//return false;
	  				if(code == "32"){
	  					alert("공백을 삽입하실 수 없습니다. 숫자만 적어주세요.");
	  				}else{
	  					alert("숫자만 적어주세요.");
	  				}

	  				$(objName).val(rtnTxt.replace(new RegExp(pattern,'g'),"")); //숫자를 제외한 모든문자
	  				$(objName).focus();
	  				return;
	  			}
	  		}
	  	}else if(sep == "eng"){ // 영어만 입력되어야 하는 경우
	  		for(i=0;i<$(objName).val().length;i++){
	  			var pattern = /[^(a-zA-Z)]/gi;   // 문자
	  			var code =$(objName).val().charCodeAt(i);
	  			//var ch = a[objName].value.substr(i,1).toUpperCase()
	  			code = parseInt(code);

	  			if(code >=65 && code <=90){ //영어만
	  			}else if(code >= 97 && code <= 122){
	  			}else{
	  				if(code == "32"){
	  					//빈문자 처리..
	  				}else{
	  					alert("영어만 적어주세요.");
	  					$(objName).val(rtnTxt.replace(new RegExp(pattern,'g'),""));//영어를 제외한 모든문자 제거
	  					$(objName).focus();
	  					return;
	  				}
	  			}
	  		}
	  	}else if(sep == "noeng"){ // 영어 + 숫자 입력되어야 하는 경우
	  		for(i=0;i<$(objName).val().length;i++){
	  			var pattern = /[^(a-zA-Z0-9)]/gi;   // 문자
	  			var code = $(objName).val().charCodeAt(i);
	  			//var ch = a[objName].value.substr(i,1).toUpperCase()
	  			code = parseInt(code);

	  			if(code >=65 && code <=90){//영어 + 숫자
	  			}else if(code >= 48 && code <= 57){
	  			}else if(code >= 97 && code <= 122){
	  			}else{
	  				if(code == "32"){
	  					//빈문자 처리..
	  				}else{
	  					alert("숫자와 영어만 적어주세요.");
	  					$(objName).val(rtnTxt.replace(new RegExp(pattern,'g'),""));//영어+숫자 제외한 모든문자 제거
	  					$(objName).focus();
	  					return;
	  				}
	  			}
	  		}
	  	}else if(sep == "kor"){ // 한글만 입력되어야 하는 경우..
	  		for(i=0;i<$(objName).size();i++){
	  			var pattern = /[^(가-힣ㄱ-ㅎㅏㅣ)]/gi;   // 문자한글
	  			var code = $(objName).val().charCodeAt(i);
	  			var ch =  $(objName).val().substr(i,1).toUpperCase()
	  			code = parseInt(code)

	  			if((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
	  			}else{
	  				if(code == "32"){
	  					alert("공백을 삽입하실 수 없습니다. 한글만 적어주세요.");
	  				}else{
	  					alert("한글만 적어주세요.");
	  				}
	  					$(objName).val(rtnTxt.replace(new RegExp(pattern,'g'),""));//한글 제외한 모든문자 제거
	  					$(objName).focus();
	  					return;
	  			}
	  		}
	  	}
	  }


	  /**
	   * 날짜 유효 체크
	   *
	   * @param date
	   * @return boolean
	   */
	  function isDate(date) {
	  	if (date == null || date.length != 10) {
	  		return false;
	  	}

	  	var date1 = date.replace(/-/gi, '');

	  	if (!isNumber(date1)) {
	  		return false;
	  	}

	  	var year = eval(date.substring(0, 4));
	  	var month = eval(date.substring(5, 7));
	  	var day = eval(date.substring(8, 10));

	  	if (month < 1 || month > 12) {
	  		return false;
	  	}

	  	var totalDays;

	  	switch (eval(month)) {

	  	case 1:
	  		totalDays = 31;
	  		break;
	  	case 2:
	  		if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
	  			totalDays = 29;
	  		else
	  			totalDays = 28;
	  		break;
	  	case 3:
	  		totalDays = 31;
	  		break;
	  	case 4:
	  		totalDays = 30;
	  		break;
	  	case 5:
	  		totalDays = 31;
	  		break;
	  	case 6:
	  		totalDays = 30;
	  		break;
	  	case 7:
	  		totalDays = 31;
	  		break;
	  	case 8:
	  		totalDays = 31;
	  		break;
	  	case 9:
	  		totalDays = 30;
	  		break;
	  	case 10:
	  		totalDays = 31;
	  		break;
	  	case 11:
	  		totalDays = 30;
	  		break;
	  	case 12:
	  		totalDays = 31;
	  		break;
	  	}

	  	// if (day > totalDays) {
	  	if (day == 0 || day > totalDays) { // 날짜체크시 일자가 0 인거에 대한 오류 추가, 20090500 도
	  										// 정상인 날짜로 인식하고 있었다.( 20090520, BYS )
	  		return false;
	  	}

	  	return true;
	  }

	  /**
	   * 날짜 체크
	   *
	   * @param date
	   * @return boolean
	   */
	  function isDateMonth(datemonth) {
	  	if (datemonth == null || datemonth.length != 6) {
	  		return false;
	  	}

	  	if (!isNumber(datemonth)) {
	  		return false;
	  	}

	  	var year = eval(datemonth.substring(0, 4));
	  	var month = eval(datemonth.substring(4, 6));

	  	if (month < 1 || month > 12) {
	  		return false;
	  	}

	  	return true;
	  }
	  /**
	   * 우편번호 형식인지 체크 한다.
	   *
	   * @param code
	   * @return boolean
	   */
	  function isZipCode(code) {

	  	if (code.length != 6) {
	  		return false;
	  	}

	  	return isNumber(code);
	  }

	  /**
	   * 시간 형식인지 체크 한다.(HH24MI)
	   *
	   * @param code
	   * @return boolean
	   */
	  function isTime(time) {

	  	if (time.length != 4) {
	  		return false;
	  	}

	  	if (!isNumber(time)) {
	  		return false;
	  	}

	  	var hour = eval(time.substring(0, 2));
	  	var minute = eval(time.substring(2, 4));

	  	if (hour < 0 || 24 < hour) {
	  		return false;
	  	}

	  	if (minute < 0 || 60 <= minute) {
	  		return false;
	  	}

	  	if (hour == 24 && minute > 0) {
	  		return false;
	  	}

	  	return true;
	  }

	  /**
	   * 초 형식인지 체크 한다.(SS)
	   *
	   * @param sec
	   * @return boolean
	   */
	  function isSecond(sec) {

	  	if (sec.length != 2) {
	  		return false;
	  	}

	  	if (!isNumber(sec)) {
	  		return false;
	  	}

	  	var ss = eval(sec);

	  	if (ss < 0 || 60 <= ss) {
	  		return false;
	  	}

	  	return true;
	  }

	  function ltrim(str) {
	  	var s = new String(str);

	  	if (s.substr(0, 1) == " ")
	  		return ltrim(s.substr(1));
	  	else
	  		return s;
	  }

	  function rtrim(str) {
	  	var s = new String(str);
	  	if (s.substr(s.length - 1, 1) == " ")
	  		return rtrim(s.substring(0, s.length - 1))
	  	else
	  		return s;
	  }

	  function trim(str) {
	  	return ltrim(rtrim(str));
	  }

	  function isNumber(num) {
			var notNumberPattern = /[^0-9.-]/;
			var twoDotPattern = /[0-9]*[.][0-9]*[.][0-9]*/;
			var twoMinusPattern = /[0-9]*[-][0-9]*[-][0-9]*/;
			var validRealPattern = /^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$/;
			var validIntegerPattern = /^([-]|[0-9])[0-9]*$/;
			var validNumberPattern = /(^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$)|(^([-]|[0-9])[0-9]*$)/;

			num = rtrim(num);
			return !notNumberPattern.test(num) && !twoDotPattern.test(num)
					&& !twoMinusPattern.test(num) && validNumberPattern.test(num);
		}


	//////////////////////////////////////////////// 팝업관련 js 객체
	// 공통 팝업
	function CmmnPopup(url, params){
		this.url = url;
		this.params = params;	// 배열
	}

	CmmnPopup.prototype.openPopup = function(){

        $("div.modal-content").load(this.url, this.params, function(response, status, xhr) {

            if(status == "success"){

                $("div.modal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
	}
    //////////////////////////////////////////////// 팝업관련 js 객체

	//////////////////////////////////////////////// ajax action 관련 js 객체
	function AjaxActionObject(url, params){
		this.url = url;
		this.params = params;
		this.success = false;
	}

	AjaxActionObject.prototype.submit = function(){

        // action
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": this.url,
            "data": this.params,
            "success": result => {

                if (result.isSuccess) {

                    alert(result.message);
                    $("div.modal").modal('hide');
                    this.success = true;
                } else {

                    var errorMsg = "";
                    for(var i = 0 ; i < result.errorMessages.length ; i++){

                        errorMsg = errorMsg + result.errorMessages[i] + "\n"
                    }
                    alert(errorMsg);
                }
            },
            "error": function(xhr, status, error){

                alert("ERROR : " +
                        "\n Status Code : " + xhr.status
                      + "\n Status Text : " + xhr.statusText
//                    + "\n Error Message : \n " + xhr.responseJSON.errorMessage
                );
            }
        });
	}
    //////////////////////////////////////////////// ajax action 관련 js 객체


	//////////////////////////////////////////////// Firebase Dynamic Links REST API
	function FirebaseDynamicLinks(link){
		this.link = link;

		this.endPoint = "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=AIzaSyDRHXkx8eMiB2xBB58gUX04iPIypPTILPo";
		this.dynamicLinkDomain = "ec4.page.link";
		this.option = "SHORT"; 					// 'UNGUESSABLE' or 'SHORT'

		this.success = false;
		this.message = "";
		this.shortLinks = "";
	}


	FirebaseDynamicLinks.prototype.shortenLinks = function(){

		let body = new Object();
        let linkInfo = new Object();
        let suffix = new Object();

        linkInfo.dynamicLinkDomain = this.dynamicLinkDomain;
        linkInfo.link = this.link;

        suffix.option = this.option;    // 'UNGUESSABLE' or 'SHORT'

        body.dynamicLinkInfo = linkInfo;
        body.suffix = suffix;

        let jsonData = JSON.stringify(body);

        // action
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/json; charset=UTF-8",
            "url": this.endPoint,
            "data": jsonData,
            "success": result => {

            	if(result.shortLink){

                    this.success = true;
                    this.message = "success";
                    this.shortLinks = result.shortLink;
                } else {

                	alert("No Result...");

                	this.success = false;
                	this.message = "No Result...";
                	this.shortLinks = "";
                }
            },
            "error": (xhr, status, error) => {

            	alert("Error...");

                this.success = false;
                this.message = xhr.responseJSON.error.message;
                this.shortLinks = "";
            }
        });
        // ajax

	}
    ////////////////////////////////////////////////

