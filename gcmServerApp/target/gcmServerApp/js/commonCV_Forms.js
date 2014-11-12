//commonCV_Forms.js

var browserInfoMapActual = {};

function getFormKvpEmail(){
		browserInfoMapActual = getBrowserVersion();
		browserInfoMapActual['lastUrl'] = getLastUrl();
		browserInfoMapActual['InitiationDate'] = getDateTime();
		browserInfoMapActual['CustMobile'] = getOS();
		//getIpAddress(browserInfoMapActual);
		
}

function setFormKvps(debug, formName){
	
	  for (var prop in browserInfoMapActual) {
      if(browserInfoMapActual.hasOwnProperty(prop)){
		  if(debug === true){
			console.log(prop + " = " + browserInfoMapActual[prop]);
			}
			$('<input>').attr({
					type: 'hidden',
					id: prop,
					name: prop,
					value: browserInfoMapActual[prop]
				}).appendTo('#'+formName);	
      }
	}
}


	function submitNamedForm(formName){
		console.log("Submit Named Forms called for : "+ formName);
		if($('#'+formName+' > input:hidden').length < 1){
				try{
					setFormKvps(false, formName);
				}catch(err){
					
				}finally{
					$('#'+formName).submit();
				}
		}else{
			$('#'+formName).submit();
		}
		
		


	}

			function getBrowserVersion(){
					var browserInfoMap = {};
					browserInfoMap['browserName'] = $.browser.name;
					browserInfoMap['CustBrowserRelease'] = $.browser.name + " " +$.browser.versionNumber;
					browserInfoMap['browserVersionNumber'] = $.browser.versionNumber;
					return browserInfoMap;
				}

				function getLastUrl(){
					return document.referrer;
				}

				function getDateTime(){
					return new Date();
				}


				function getOS(){
					return navigator.platform;
				}

				function getIpAddress(map){
					var ipString;
					$.getJSON("http://jsonip.com?callback=?", function (data) {
							ipString = data.ip.toString();
							map['CustIPAddress'] = ipString;
					});		
				}