var modal = new AXModal();
var pop_modal = new AXModal();
pop_modal.setConfig({
    windowID: "modal_popup", 
    displayLoading: true,
    defaultTop: 50,
    contentDivClass: "bodyHeightDiv",
    mediaQuery: { mx: {min: 0, max: 767}, dx: {min: 767}},
    scrollLock: true,
    closeButton: true,
    onclose: function () {
        //toast.push("모달 close");
    }
});	
var carObj = {

	listTestCarResv: function(data) {
		//trace("data",data);
		var grid = $("#masterGrid").DataTable();
			grid.rows().remove().draw();
        $.each(data, function(idx, item) {
        	//trace(idx, item);
        	var row = idx+1;
        	
        	if(row == 1){
                grid.row.add(
        	    		['<input type="radio" class="no_border"  name="radioFld" id="radioFld_"'+row+'" onclick="carObj.radioBox(this)" value="" />',
        	    		"전체"]).draw();
                row = idx+1;
        	}
        	var idString = "{0}".format(item.vin);        	
            grid.row.add(
	    		['<input type="radio" class="no_border"  name="radioFld" id="radioFld_"'+row+'" onclick="carObj.radioBox(this)" value="'+idString+'" />',
	    		"{0} / {1}".format(item.dealerNm, "{0}({1}}".format(item.variantNm2, item.mngCarNo))]).draw();
        });
	},

	loadTestCarResv: function() {
	    var param = {
	      "sDealerId": $("#sDealerId").val() 
	    };

	    var url = "/ec4/call/cnslt/jsonListTestCarResv.json";
	    new AXReq(url, {
	      pars : param,
	      onsucc : function(res) {
	        if (res.ok == true) {
	        	carObj.listTestCarResv(res.data);
	        } else {
	          AXUtil.alert(res.message);
	        }
	      },
	      onerr : function(res) {
	        trace("error", res.status, res.statusText);
	      }
	    }); 		
	},
	
	viewTestCarInfo: function(data) {
		//trace("viewTestCarInfo data", data)
		try{
			$("#vin").html('<a href="javascript:fn_pop_vin(\''+data.vin+'\');">'+data.vin+'</a>');
			$("#vin2").val(data.vin);		
			$("#mngCarNo").text(data.mngCarNo);
		}catch(e){}
	},
	
	viewTestCarInfoClear: function(data) {
		//trace("viewTestCarInfo data", data)
		$("#vin").html('');
		$("#vin2").val('');		
		$("#mngCarNo").text('');
	},
	
	loadTestCarInfo: function(vin) {
		carObj.viewTestCarInfoClear();
	    var parm = {
  	      "vin": vin
  	    };
	    //trace("parm", parm);
  	    var url = "/ec4/call/cnslt/jsonViewTestCarInfo.json";
  	    new AXReq(url, {
  	      pars : parm,
  	      onsucc : function(res) {
  	        if (res.ok == true) {
  	        	carObj.viewTestCarInfo(res.data);
  	        	carObj.loadEventResource();
  	        	
  	        } else {
  	          AXUtil.alert(res.message);
  	        }
  	      },
  	      onerr : function(res) {
  	        trace("error", res.status, res.statusText);
  	      }
  	    }); 	
	},
	
	masterGridInit : function() {
		$("#masterGrid").dataTable({
	        "destroy": true,
	        "scrollX" : false,
	        "scrollY" : "200px",
	        "scrollCollapse" : false,        
	        "paging" : false,
	        "info" : false,
	        "searching" : false,
	        "columnDefs": [ 
	       	    { "orderable": false, "width":"40px", "targets": 0 },	                       
	            { "orderable": false, "targets": 1 }
	         ],           
	         "columns": [
	     	            {className: "grid_data_c" },
	     	            {className: "grid_data_l" }
	     	            ],
	         "order": [],
	         "language" : { "emptyTable": "데이터가 존재하지 않습니다." },         
	         "initComplete": function(settings, json) {
	        	 carObj.loadTestCarResv();
	         }
	     });	
	},
	
	loadEventResource: function() {
		var rdIdx = 0;
		$("input[name=radioFld]").each(function(){
			var index = $("[name=radioFld]").index(this);
			if($("[name=radioFld]" ).eq(index).is(":checked") == true){
				rdIdx = index;
			}
     	});		
		if(rdIdx == 0){//전체 선택한 경우는 검색되도록 통과
			$("#dealerId").val($("#sDealerId").val());
		}else{
	    	if($("#currentVin").val().isEmpty()) {
	    		return;	    	
	    	}
		}
    	var view = $('#calendar').fullCalendar('getView');
    	var param = {
	  	      "vin": $("#currentVin").val(),
	  	      "reservedDtTerm": "yes",
	  	      /*"frReservedDt":view.intervalStart.format("YYYY-MM-DD"),*/
	  	      /*"toReservedDt":view.intervalEnd.format("YYYY-MM-DD"),*/
	  	      "frReservedDt":view.start.format("YYYY-MM-DD"),
	  	      "toReservedDt":view.end.format("YYYY-MM-DD"),
	  	      "dealerId" : $("#dealerId").val()
	  	    };
    	//trace(param);
    	carObj.removeEventResource();
    	var url = "/ec4/call/cnslt/cnsltScheduleMngList.do";
  	    new AXReq(url, {
  	      pars : param,
  	      onsucc : function(res) {
  	        if (res.ok == true) {
  	        	//trace("data",res.data)
  	        	var events = [];
  	        	$.each(res.data, function(idx, item){
  	        		var sColor, tColor;
  	        		var reserveDate = moment(item.toTimeLong, moment.ISO_8601);
  	        		var currentDate = moment();
  	        		if(item.endKm == null && reserveDate.diff(currentDate, "hour", true) <= 0) {
  	        			sColor = "#c6ebc6";
  	        			tColor = "#000000";
  	        		} else if(item.endKm == null && reserveDate.diff(currentDate, "hour", true) > 0) {
  	        			sColor = "#00cc00";
  	        			tColor = "#ffffff";
  	        		} else {
  	        			sColor = "#424242"
  	        			tColor = "#ffffff";
  	        		}
  	        		
	  	        	events.push({
	  	        		id: "{0}-{1}-{2}".format(item.testCarNo,item.reservedDt, item.fromTime),
	  	        		title: "{0}(고객:{1})".format(item.resUserNm, item.custNm == null ? "고객없음" : item.custNm ),
	  	        		start:item.fromTimeLong,
	  	        		end:item.toTimeLong,
	  	        		constraint:item.resMemo,
	  	        		color:sColor,
	  	        		textColor:tColor,
	  	        		url:"javascript:carObj.popupTestCarResvSave('{0}','{1}','{2}');".format(item.reservedDt, item.fromTime, item.dealerId)
	  	        	});
  	        	});
  	        	//trace('events', events);
  	        	$('#calendar').fullCalendar('addEventSource', events);  	        	
  	        } else {
  	          //AXUtil.alert(res.message);  임시주석20190104
  	        }
  	      },
  	      onerr : function(res) {
  	        trace("error", res.status, res.statusText);
  	      }
  	    });
	},
	
	removeEventResource: function() {
		$('#calendar').fullCalendar('removeEvents');
	},
	/****************************
	 * 팝업
	 ****************************/
	popupVehicleInfo: function() {
		
	    modal.openNew({
	        url : "/venis/crm/activemaster/sfaactive/custDetail.do?searchCustSeq="+custSeq,
	        pars : "",
	        name : "modal_new",
	        options : "width=600,height=300,resizable=yes"
	      }); 		
	},	
	popupTestCarResvSave: function(reservedDt, fromTime, dealerId) {
		
		
		var params = {         
    	    //vin: $("#vin").val(),
    	    reservedDt: reservedDt,	    	    
    	    fromTime: fromTime,
    	    fromResv: "",
    	    openMode: "modal" /*modal팝업을위해 추가함 20180220*/
	    }
		//trace("param", param);
		//var txtUrl = "/ec4/call/cnslt/popCnsltSchedule.do?"+$.param(param);
		var txtUrl = "/ec4/call/cnslt/popCnsltSchedule.do";
		 $("div.modal-content").load(txtUrl, params, function(response, status, xhr) {

		     if(status == "success"){

		         $("div.modal").modal({"backdrop": "static", "keyboard": false});
		     }else if(status == "error"){

		         alert("ERROR : " +
		                 "\n Status Code : " + xhr.status
		                 + "\n Status Text : " + xhr.statusText
		                 //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
		              );
		         return;
		     }
		 });
		
		//NewWindow(txtUrl, "win_popup", "900", "500", "NO", "NO");
		//NewWindow_modal(txtUrl, 'mda_popup', '900', '500', 'YES', 'NO');//url, 팝업창이름, width, height, scroll, resize, 장제 top
	    /*modal.openNew({
	        url : "/ec4/call/cnslt/popCnsltSchedule.do",
	        pars : param,
	        name : "modal_new",
	        options : "width=900,height=500,resizable=yes"
	    });*/	
	},
	/****************************
	 * 이벤트
	 ****************************/
	radioBox: function(obj) {
		$("#currentVin").val($(obj).val());
		carObj.loadTestCarInfo($(obj).val());		
	},

	/****************************
	 * 버튼
	 ****************************/
	btnSearch: function() {
		carObj.loadTestCarResv();
		carObj.removeEventResource();
    	carObj.viewTestCarInfoClear();
	},
	btnPopupSearch: function() {
		carObj.loadTestCarInfo($("#currentVin").val());
	}
	
};

$(function() {
  carObj.masterGridInit();
  /* initialize the calendar
  -----------------------------------------------------------------*/
  var calendar = $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      //right: 'month,basicWeek,basicDay,timelineDay'
      right: 'month,basicWeek'
    },
    eventLimit: true,
    dayClick: function(date) {
    	//param : date, jsEvent, view, resourceObj
    	//trace('dayClick: ' + date.format());
    	//item.reservedDt, item.fromTime, item.dealerId
    	carObj.popupTestCarResvSave(date.format(), "", $("#sDealerId").val())
    },
/*  eventClick: function(event, element) {
        //event.title = "CLICKED!";
        //trace("eventClick", event);
        //$('#calendar').fullCalendar('updateEvent', event);
    },       
    select: function(start, end, allDay) {
        //var title = prompt('Event Title:');
    	
        var title ="aaaaaaaa";
        if (title) {
            calendar.fullCalendar('renderEvent',
                {
                    title: title,
                    start: start,
                    end: end,
                    allDay: allDay
                },
                true // make the event "stick"
            );
        }
        calendar.fullCalendar('unselect');
        trace("select");
        
    }, */   
    //selectable: true,    
    editable: true,
    events: function(start, end, timezone, callback) {
		var rdIdx = 0;
		$("input[name=radioFld]").each(function(){
			var index = $("[name=radioFld]").index(this);
			if($("[name=radioFld]" ).eq(index).is(":checked") == true){
				rdIdx = index;
			}
     	});		
		if(rdIdx == 0){//전체 선택한 경우는 검색되도록 통과
			$("#dealerId").val($("#sDealerId").val());
		}else{
	    	if($("#currentVin").val().isEmpty()) {
	    		callback([]);
	    		return;	    	
	    	}
		}
    	var param = {
	  	      "vin": $("#currentVin").val(),
	  	      "reservedDtTerm": "yes",
	  	      "frReservedDt":start.format("YYYY-MM-DD"),
	  	      "toReservedDt":end.format("YYYY-MM-DD"),
	  	      "dealerId" : $("#dealerId").val()
	  	    };
    	carObj.removeEventResource();   	
    	var url = "/ec4/call/cnslt/cnsltScheduleMngList.do";
  	    new AXReq(url, {
  	      pars : param,
  	      onsucc : function(res) {
  	        if (res.ok == true) {
  	        	var events = [];
  	        	$.each(res.data, function(idx, item){
  	        		var sColor, tColor;
  	        		var reserveDate = moment(item.toTimeLong, moment.ISO_8601);
  	        		var currentDate = moment();
  	        		if(item.endKm == null && reserveDate.diff(currentDate, "hour", true) <= 0) {
  	        			sColor = "#c6ebc6";
  	        			tColor = "#000000";
  	        		} else if(item.endKm == null && reserveDate.diff(currentDate, "hour", true) > 0) {
  	        			sColor = "#00cc00";
  	        			tColor = "#ffffff";
  	        		} else {
  	        			sColor = "#424242"
  	        			tColor = "#ffffff";
  	        		}  	        		
	  	        	events.push({
	  	        		id: "{0}-{1}-{2}".format(item.testCarNo,item.reservedDt, item.fromTime),
	  	        		title: "{0}(고객:{1})".format(item.resUserNm, item.custNm),
	  	        		start:item.fromTimeLong,
	  	        		end:item.toTimeLong,
	  	        		constraint:item.resMemo,
	  	        		color:sColor,
	  	        		textColor:tColor,	  	        		
	  	        		url:"javascript:carObj.popupTestCarResvSave('{0}','{1}','{2}');".format(item.reservedDt, item.fromTime, item.dealerId)
	  	        	});	        		
  	        	});
  	        	callback(events);
  	        } else {
  	          //AXUtil.alert(res.message);  임시주석20190104
  	        }
  	      },
  	      onerr : function(res) {
  	        trace("error", res.status, res.statusText);
  	      }
  	    });
    },
    eventRender: function(event, element) {
        //trace("eventRender");
    },    
    eventAfterRender: function( event, element, view ) { 
    	//trace("eventAfterRender");
    },
    eventAfterAllRender: function() {
        //trace("eventAfterAllRender");
    }
  });

});




/*지점 SELECT박스 세팅*/
$(document).on('change', "#sDealerId", function(){
		carObj.removeEventResource();
		carObj.viewTestCarInfoClear();
		var grid = $("#masterGrid").DataTable();
		grid.rows().remove().draw();
	  
});



/**모달용 팝업*/
function NewWindow_modal(mypage, myname, w, h, scroll, resize) {
	
	var url = mypage;
	var pars = "";
	if(mypage.indexOf(".do?") > 0){
		url = mypage.substring(0,mypage.indexOf(".do?")+3);
		pars = mypage.substring(mypage.indexOf(".do?")+4,mypage.length)+"&modal_height="+h;
	}else if(mypage.indexOf(".do") > 0){
		pars="modal_height="+h;
	}

	var height = $(this).outerHeight();
	top = (height - h)/2;
	var top = 10;
	top = (height - h)/2;
	if(top < 0) top = 10;
	pop_modal.open({
        url: url,
        width: w,
        height: h,
        top: top,
        pars: pars.queryToObject(),
        closeByEscKey: true
    });	
}