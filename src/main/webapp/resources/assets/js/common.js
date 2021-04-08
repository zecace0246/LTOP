$(function () {
	$.fn.serializeObject = function() { 
		var obj = null; 
		try { 
			if ( this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
				var arr = this.serializeArray(); 
				if ( arr ) { 
					obj = {}; 
					
					$.each(arr, function() { 
						obj[this.name] = this.value; 
					}); 
				}	 
			} 
		} catch(e) {
			alert(e.message);
		} finally {} 
		
		return obj; 	
	};
});

function gfn_callMenu(type, action, asyncFlag, dataString, dataTypeString, successFunction, setTimeout) {
	if (type == null || $.trim(type) == "") type = "GET";
	if (action == null || $.trim(action) == "") return;
	
	$.ajax({
		type : type,
		url : action,
		timeout : setTimeout,
		data : dataString,
		async : asyncFlag,
		dataType : dataTypeString, //xml, html, json, script, text	
		success : function(data) {
			successFunction(data);
		},
		error : function(xhr, status, err) {
			console.log('xhr : ', xhr);
			console.log('status : ', status);
			console.log('err : ', err);
		}
	});
}

function gfn_callMenuResult(data) {
	$('#mainContent').html(data);
}

function gfn_callServer(type, action, asyncFlag, dataString, contentTypeString, dataTypeString, successFunction, setTimeout, csrfTokenValue) {
	if (type == null || $.trim(type) == "") type = "GET";
	if (action == null || $.trim(action) == "") return;
	
	$.ajax({
		type : type,
		url : action,
		timeout : setTimeout,
		data : dataString,
		async : asyncFlag,
		contentType : contentTypeString,
		dataType : dataTypeString, //xml, html, json, script, text
		beforeSend: function(xhr) {
			xhr.setRequestHeader('X-CSRF-TOKEN',csrfTokenValue);
		},
		success : function(data) {
			successFunction(data);
		},
		error : function(xhr, status, err) {
			console.log('xhr : ', xhr);
			console.log('status : ', status);
			console.log('err : ', err);
		}
	});
}

function gfn_callMultipartServer(type, action, asyncFlag, dataString, dataTypeString, successFunction, setTimeout, csrfTokenValue) {
	if (type == null || $.trim(type) == "") type = "GET";
	if (action == null || $.trim(action) == "") return;
	
	$.ajax({
		type : type,
		enctype: 'multipart/form-data',
		url : action,
		timeout : setTimeout,
		data : dataString,
		async : asyncFlag,
		processData : false,
		contentType : false,
		dataType : dataTypeString, //xml, html, json, script, text
		beforeSend: function(xhr) {
			xhr.setRequestHeader('X-CSRF-TOKEN',csrfTokenValue);
		},
		success : function(data) {
			successFunction(data);
		},
		error : function(xhr, status, err) {
			console.log('xhr : ', xhr);
			console.log('status : ', status);
			console.log('err : ', err);
		}
	});
}

/**
 * @Description  : null check (널 값 확인)
 * @param        : str - string
 * @returns      : true/false
 */
function gfn_isNull(str) {
	if (str == null) {
		return true;
	}
	if (str == "NaN") {
		return true;
	}
	if (new String(str).valueOf() == "undefined") {
		return true;    
	}
    
	var chkStr = new String(str);
    
	if (chkStr.valueOf() == "undefined") {
		return true;
	}
    if (chkStr == null) {
    	return true;    
    }
    if (chkStr.toString().length == 0) {
    	return true;             
    }
    
    return false; 
}