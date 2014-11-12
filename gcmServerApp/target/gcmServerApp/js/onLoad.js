if($.fn.jquery === "1.7.2"){
				
			}else{
				console.log($.fn.jquery);
				$=$.noConflict(true);
				jQuery = jQuery.noConflict(true);
				console.log("called");
			}	