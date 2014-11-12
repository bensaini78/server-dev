function hookevent(){
	$("#button").click(function(){
		$.ajax({
                type:"GET", 
                url:"/cvContactUs/rest/test/getJsonMessage",
				data: {payload:$("#payload").val()},	
                dataType:'json', 
				async: false,
                success:function(data){
					//console.log(data);
						vdata = JSON.stringify(data);
						loadForms(vdata);
					  }
                });
		});		
}
	
	
				function loadForms(vdata){
					$.ajax({
					type:"POST", 
					url:"/cvContactUs/rest/email/getForm",
					data: {message:vdata, appName:$("#appName").val(), accessKey:$("#accessKey").val(), lang:$("#lang").val()},	
					dataType:'HTML', 
					async: false,
					success:function(cdata){
						//console.log(cdata);
						$("#adminCVforms").html(cdata);
									}
					});
				}
				