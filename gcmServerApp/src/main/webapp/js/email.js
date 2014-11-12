var chatAlias, secureKey, userId, scriptPos, refreshId;
var faqsDisplayed = false;
var nextFaqUrlNumber= 1;
var parent_file_id=1;
var fileExtension = [".pdf", ".doc", ".docx", ".xls", ".xlsx", ".csv", ".txt", ".rtf", ".html", ".htm",".mht", ".HTML", ".jpg", ".jpeg", ".png", ".gif", ".bmp"];
var popChatUrl;
var popWin;
var pageTimeout;


function dropDrownsDivs(){
	
	var ids =  ['CustProdChat', 'CustProdEmail'] ;

	$('div[id=CustProdChat]').click(function(e){
			
			if($(this).hasClass('active')===false){
					 $(this).addClass('active');
					 $('div[id=CustProdChat]').next().show();
					} else {
				    	$(this).removeClass('active');
					 $('div[id=CustProdChat]').next().hide();	
					}
			$(this).focus();		
			});
			
			
		$('div[id=CustProdChat]').next().children().each(function(e){ 
				$(this).click(function(e){
					$('div[id=CustProdChat]').html($(this).html());
					$('div[id=CustProdChat]').next().hide();
					$('div[id=CustProdChat]').removeClass('active');
					productId = $(this).attr('productId');
					$('select[id=CustProdChat]').children().each(function(){ if($(this).attr('productId')===productId){$(this).prop('selected', true);
						$('select[id=CustProdChat]').click();
					}});
				});
				
		});	
		
		$('div[id=CustProdEmail]').click(function(e){
			
			if($(this).hasClass('active')===false){
			
					 $(this).addClass('active');
					 $('div[id=CustProdEmail]').next().show();
					 $('div[id=ServiceSubTypeEmail]').removeClass('active');
					 $('div[id=ServiceSubTypeEmail]').next().hide();
					} else {
					
				    	$(this).removeClass('active');
					 $('div[id=CustProdEmail]').next().hide();	
					}
			$(this).focus();		
			});
	
		$('div[id=CustProdEmail]').next().children().each(function(e){ 
				$(this).click(function(e){
					$('div[id=CustProdEmail]').html($(this).html());
					$('div[id=CustProdEmail]').next().hide();
					$('div[id=CustProdEmail]').removeClass('active');
					productId = $(this).attr('productId');
					$('select[id=CustProdEmail]').children().each(function(){ if($(this).attr('productId')===productId){$(this).prop('selected', true);
						$('select[id=CustProdEmail]').click();
					}});
					showSubproduct();
				});
				
		});	
		
		
		$('div[id=ServiceSubTypeEmail]').click(function(e){
			
			if($(this).hasClass('active')===false){
			
					 $(this).addClass('active');
					 $('div[id=ServiceSubTypeEmail]').next().show();
					 $('div[id=CustProdEmail]').removeClass('active');
					 $('div[id=CustProdEmail]').next().hide();
					} else {
					
				    	$(this).removeClass('active');
					 $('div[id=ServiceSubTypeEmail]').next().hide();	
					}
			$(this).focus();		
			});
	
	
		
		
	
}

function showSubproduct(){
	console.log("Sub Product called");
	
	var productDropDownValue = $('#product').find('select[name=CustProd]').val();
	if(productDropDownValue === ''){
	$('#sub-product').hide();
	$("select[name=ServiceSubType]").find('option').remove();
	}
	else{
		 var productIdSelected = $('select[name=CustProd] option:selected').attr('productId');
		 $("select[name=ServiceSubType]").find('option').remove();
		 $("ul[name=ServiceSubTypeEmail]").find('li').remove();
		 $('div[id=ServiceSubTypeEmail]').html("Make a selection");
		
		 $.ajax({
             type:"GET", 
             url: hostUrl+"/rest/util/getSubProduct", 
				data: "productId="+productIdSelected,
             dataType:'json', 
				async: false,
             success:function(data){
				
            	 $("select[name=ServiceSubType]").append($("<option></option>").attr("value","").text("Make a selection"));
            	
				 $.each(data, function(index,value){
				
					 $("select[name=ServiceSubType]").append($("<option></option>").attr("value",value[0]).text(value[1]));
					 $("ul[name=ServiceSubTypeEmail]").append($("<li></li>").attr("productId",value[0]).text(value[1]));
					 
				 	});
				 
				 $("ul[name=ServiceSubTypeEmail]").children().each(function(e){ 
						$(this).click(function(e){
							$('div[id=ServiceSubTypeEmail]').html($(this).html());
							$('div[id=ServiceSubTypeEmail]').next().hide();
							$('div[id=ServiceSubTypeEmail]').removeClass('active');
							productId = $(this).attr('productId');
							console.log("Value is : " + productId);
							$('select[id=ServiceSubTypeEmail]').children().each(function(){ if($(this).val()===productId){
								$(this).prop('selected', true);
								$("select[id=ServiceSubTypeEmail]").click();
							}});
					});
				 });
				 
						 if($("select[name=ServiceSubType]").children().length > 2){
							 $('#sub-product').show();
							 
						 }else{
							 $('#sub-product').hide();
							 $("select[id=ServiceSubTypeEmail]").append($("<option></option>").attr("value",$('select[name=CustProd] option:selected').val()).text($('select[name=CustProd] option:selected').val()));
							 $('select[id=ServiceSubTypeEmail]').children().last().prop('selected', true);
							 $('select[id=ServiceSubTypeEmail]').click();
						 }
		        }});
			
	}

}


function chatFormSubmit(){
	
	$("input[name=chatSubmit]").attr('disabled', 'disabled');
	$("#submittingChatFormMsg").show();
	
	$.ajax({
	                type:"POST", 
	               // url: hostUrl+"/rest/sendChatInitiationReq", 
	                url: hostUrl+"/rest/sendChatInitiationReq",
					data: $("form[name=chatForm]").serialize(),
	                dataType:'json', 
					async: false,
	                success:function(data){
						responseData = data;
						chatUserSessionData = responseData['chatUserSessionData'];
						chatAlias = chatUserSessionData['chatAlias'];
						secureKey = chatUserSessionData['secureKey'];
						userId = chatUserSessionData['userId'];
						scriptPos = chatUserSessionData['scriptPos'];
						clearInterval(pageTimeout);
						launchChatUrlFinal = chatHostUrl+'/rest/chat/popChat?chatAlias='+chatAlias+'&userId='+userId+'&secureKey='+secureKey+'&scriptPos='+scriptPos;
						
						setTimeout(function(){
							if(!ios){
							popWin.location = launchChatUrlFinal;
							}else{
								popWin = window.open(launchChatUrlFinal, '_blank', 'location=0,menubar=0,status=0,scrollbars=0,width=330,height=515,scrollbars=yes');
							}
							$("#submittingChatFormMsg").hide();
						}, 1000);
						
					},
	                error: function(){popWin.close();
	                	popWin = null;}   
	                });
		$("li[name=topBarChat]").each(function(){
			$(this).unbind('click');
			$(this).find("a").attr('href', '/support/live?page=chat');
			$(this).find("a").removeAttr('onclick');
		});
		
	}	


function emailFormSubmit(){
	clearInterval(pageTimeout);
	$("input[name=emailSubmit]").attr('disabled', 'disabled');
	$("#submittingFormMsg").show();
	//$("form[name=emailForm]")[0].submit();
	if (!!window.FileReader){	
	$.ajax({		
	                type:"POST", 
	                url: hostUrl+"/rest/sendEmailWithAttachment", 
					//data: $("form[name=emailForm]").serialize(),
	                data: new FormData($("#emailForm")[0]),
	                processData: false,
				    contentType: false,
	                dataType:'HTML', 
					async: false,
	                success:function(data){
						emailResponseData = data;
						//console.log(emailResponseData);
						$("#htmlContent").html(emailResponseData);
						$("#ccisForm").html(emailResponseData);
						$("#adminCVforms").html(emailResponseData);
	                   }
	                });
		}
			else{
				$("form[name=emailForm]").attr('target','submitiframe');
				$("form[name=emailForm]")[0].submit();
				$("#submitiframe").load(function(){
					//console.log(document.getElementById( 'submitiframe' ).contentWindow.document.body.children[0]);
					var child = document.getElementById( 'submitiframe' ).contentWindow.document.body.children[0];
					$("#emailFormContainer").html(child); 
					$("#htmlContent").html(child);
				});
			}
	window.scrollTo(0, 0);
	}	
			
var dataHtml = 0;
var dataHtmlArray = null;
var returnedData = null;
var popUpArray = [];

function fetchFaqs(formType){
		if(formType == 'email'){
		vSubject = $("#emailForm").find("input[name=subject]").val();
		vBody = $("#emailForm").find("textarea[name=body]").val();
		FormName='emailForm';
		}else{
			vSubject = $("#chatForm").find("input[name=subject]").val();
			vBody = $("#chatForm").find("input[name=subject]").val();
			FormName='chatForm';
		}
		
		$.ajax({
			type:"POST",
			url:hostUrl+"/rest/util/getTopLinks",
			//url:"/cvContactUs/rest/util/getTopLinks",
			data: {subject: vSubject, body: vBody}, 
			dataType: 'JSON',
			success: function(dataV){ 
				returnedData = dataV; 
				try{
				dummy = returnedData['sa'];
				dummy = dummy[0];
				dummy = dummy['val'];
				$.each(dummy, function(key){ 
						dummyX = dummy[key];
						lolUrl= rntHostUrl+dummyX[4].replace('preview_','');
						//console.log(lolUrl);
						popUpArray.push("<li><a href=\""+lolUrl+"\" target='_blank' onclick='javascript:appendFaqs(\""+lolUrl+"\",\""+FormName+"\");'>"+dummyX[1]+"</a></li>");
						});
						if(popUpArray.length > 1){
						//popUpstring = "<B>FAQs</B></br>"+popUpArray[0]+popUpArray[1]+popUpArray[2]+popUpArray[3]+popUpArray[4];
						popUpstring = popUpArray[0]+popUpArray[1]+popUpArray[2]+popUpArray[3]+popUpArray[4];
						//$.msg({content: popUpstring, autoUnblock : false});	
						
							if(formType == 'email'){
								showFaqsMsgEmail(popUpstring, formType);
							}else{
								popWin.close();
								showFaqsMsgChat(popUpstring, formType);
							}
						}
				}catch(err){
					//form.submit();
					console.log("In Catch Err");
					if(formType == 'email'){
						emailFormSubmit();
					}else{
						chatFormSubmit();
					}
				}
				$("#submittingFormMsg").hide();
				faqsDisplayed = true;	
				return "true";
							
		}});
		
}

function showFaqsMsgEmail(popUpstring, formType){
	
	  $.msg({
	      autoUnblock : false,
	      clickUnblock : true,
	      bgPath: hostUrl+'/images/',
	    //  klass: '/cvContactUs/css/live.css',
	      content: "<div class='finish_submit_popup'>"+
	  	"<a href='#' class='close_btn'></a>"+
	    "<div class='popup_title'>Finish submitting your question</div>"+
		"<div class='popup_content'>"+
	    	"<div class='popup_sub_title'>"+
	        	"<span>&nbsp;</span>You question hasn’t been submitted yet. </div>"+
	       "<p class='text'><strong>The following answers might help you immediately.</strong> (Answers open in a separate window.)</p>"+
	        "<ul>"+
		popUpstring+
	        	"</ul>"+
	        "<div class='popup_btns'>"+
	        	"<button id='finishSubmitBtn' class='btn_submit'>Finish submitting question</button>"+
	        	"<button id='finishSubmitNot' class='btn_back'>Back</button>"+
	        "</div>"+
	    "</div>"+
	"</div>",
	      afterBlock : function(){
	        // store 'this' for other scope to use
	        var self = this;

	        // Submit user and take the popup out
	        // when click #finishSubmitBtn
	        $( '#finishSubmitBtn' ).bind( 'click', function(){
				self.unblock();
				if(formType == 'email'){
					try{
						reporting.trackClick(this,'Email Us | Finish');
					}catch(err){
						console.log('Could not do reporting on Email Us /Finish - inform CAS-Asif');
					}
					emailFormSubmit();
				}else{
					chatFormSubmit();
				}
	        });

	        $( '#finishSubmitNot' ).bind( 'click', function(){
	          self.unblock();
	        });
	        
	        $( '#closeFaqMsg' ).bind( 'click', function(){
		          self.unblock();
		        });
	      },
	      beforeUnblock : function(){
	        //alert( 'This is a callback from beforeUnblock event handler :)' );
	      }
	    });
}

function showFaqsMsgChat(popUpstring, formType){
	
	
	  $.msg({
	      autoUnblock : false,
	      clickUnblock : true,
	      bgPath: hostUrl+'/images/',
	     // klass: '/cvContactUs/css/live.css',
	      content: "<div class='yui-panel-container yui-dialog yui-simple-dialog'id='rnDialog1_c' style='visibility: visible; left: 373px; top: 428px; z-index: 4;'>"+
		"<div id='rnDialog1' class='yui-module yui-overlay yui-panel rn_Dialog rn_SmartAssistantDialogContainer' style='visibility: inherit; width: 600px;' aria-labelledby='rn_Dialog_1_Title' role='dialog'>"+
			"<div class='hd' style='cursor: auto;'>"+
				"<span id='rn_Dialog_1_Title'>Finish submitting your question</span>"+
			"</div>"+
			"<div class='bd'>"+
			"<div id='rn_SmartAssistantDialog_19' class='rn_SmartAssistantDialog'>"+
				"<div class='rn_MessageBox rn_InfoMessage'>"+
					"<span id='rn_SmartAssistantDialog_19_DialogHeading' class='rn_Heading'>Your question hasn't been submitted yet.</span>"+
				"</div>"+
				"<div id='rn_SmartAssistantDialog_19_DialogContent'>"+
				"<div class='rn_Prompt'>The following answers might help you immediately. (Answers open in a separate window.)</div>"+
				"<ul class='rn_List'>"+
				popUpstring+
			"</div>"+
			"<form name='frm_rnDialog1'>"+
			"<input type='hidden' name='rnDialog1' value=''>"+
			"<input type='hidden' name='rnDialog1' value=''>"+
			"</form></div>"+
				"<div class='ft'>"+
					"<span class='button-group'>"+
						"<button type='button' id='finishSubmitBtn' class='default'>"+
						"<a onClick='javascript:popWin=window.open(&#39 &#39, &#39popupWindow&#39, &#39location=0,menubar=0,status=0,scrollbars=0,width=600,height=500,scrollbars=yes&#39);'/>"+
							"Finish Submitting Question</button>"+
						"<button id='finishSubmitNot' type='button'>Back</button></span>"+
				"</div>"+
				"<a id='closeFaqMsg' class='container-close' href='#' style='overflow: hidden; text-indent: -10000em; text-decoration: none;'>Close</a>"+
		"</div>"+
	"</div>",
	      afterBlock : function(){
	        // store 'this' for other scope to use
	        var self = this;

	        // Submit user and take the popup out
	        // when click #finishSubmitBtn
	        $( '#finishSubmitBtn' ).bind( 'click', function(){
				self.unblock();
				if(formType == 'email'){
					emailFormSubmit();
				}else{
					chatFormSubmit();
				}
	        });

	        $( '#finishSubmitNot' ).bind( 'click', function(){
	          self.unblock();
	        });
	        
	        $( '#closeFaqMsg' ).bind( 'click', function(){
		          self.unblock();
		        });
	      },
	      beforeUnblock : function(){
	        //alert( 'This is a callback from beforeUnblock event handler :)' );
	      }
	    });
}


function appendFaqs(FaqUrl, FormName){
	
	console.log("FAQ Urls" + FaqUrl);

	if($("input[type=hidden][name='SessionURL'+'\''+nextFaqUrlNumber+'\'']").length > 0){
	
		$("input[type=hidden][name='SessionURL'+'\''+nextFaqUrlNumber+'\'']").val(FaqUrl);
	}else{
			$('<input>').attr({
					type: 'hidden',
					id: 'SessionURL'+nextFaqUrlNumber,
					name: 'SessionURL'+nextFaqUrlNumber,
					value: FaqUrl
				}).appendTo('#'+FormName+'');	
	
	}
	if(nextFaqUrlNumber > 4){
		nextFaqUrlNumber=1;
	}else{
		nextFaqUrlNumber++;	
	}
}

function truncate(n, len) {

    n = n.toLowerCase();

    if (n.length <= len) {
            return n;
    }

    if (n.lastIndexOf(".") < 0) {
            return filename.substring(0, len);
    }

    var ext = n.substring(n.lastIndexOf(".") + 1, n.length);
    var filename = n.replace('.' + ext,'');

    filename = filename.substr(0, len) + (n.length > len ? '[...]' : '');
    return filename + '.' + ext;
};


var fileUploadId = null;
var uploadiframeflag = false;
function attachMultiplFiles()
{	
	var MAX_LEN = 25;  // max length of filename
	
	if($(".file_input:hidden").length > 4){
		$("#fileTooLarge").html('Max 5 files can be attached at a time.');
		$("#fileTooLarge").show();
		return;
	}
	
	
	$("#fileTooLarge").hide();
	
	if(isFileApi()){
	
			
			if(parent_file_id>1 && $("label[for=file_input]").length > 1){				
				$("label[for=file_input]").last().after("<label for='file_input' fid="+$(".file_input:visible")[0].id+ " class='title_attach_doc'>"+ truncate($(".file_input:visible")[0].files[0].name, MAX_LEN) + "  " +(Math.round(($(".file_input:visible")[0].files[0].size/1024) * 100) / 100)+" Kb  <a href='javascript:removeFiles(\""+$(".file_input:visible")[0].id+"\")'>Remove</a> </label>");
				
			}else{
				$(".file_input:visible").after("<label for='file_input' fid="+$(".file_input:visible")[0].id+ " class='title_attach_doc'>"+ truncate($(".file_input:visible")[0].files[0].name, MAX_LEN) + "  " +(Math.round(($(".file_input:visible")[0].files[0].size/1024) * 100) / 100)+" Kb   <a href='javascript:removeFiles(\""+$(".file_input:visible")[0].id+"\")'>Remove</a> </label>");
			}
			$(".file_input:visible").hide();
			addNewFileInput();
			
			if(fileTypeValidation()){
			validateFileSize();
			}
			
			noFileChosenLabel();
	}
	else{
		//$(".file_input:visible")[0].hide();
		addNewFileInputIE();
		fileUploadName = $(".file_input:visible")[0].value.match(/[^\/\\]+$/);
		if(!validateFileType(fileUploadName)){
			$("#"+$(".file_input:visible")[0].id).remove();
			$("#fileTooLarge").html(fileUploadName +' is of Type that is not allowed for upload.');	
			$("#fileTooLarge").show();
		}else{
		
			$("#findFileSize").append($(".file_input:visible")[0]);
			$("#findFileSize > input").hide();
			document.getElementById( 'uploadiframe' ).contentWindow.document.body.innerText='';
			$("#findFileSize").submit();
			fileUploadId = $("#findFileSize > input")[0].id;
			//console.log($("#findFileSize > input")[0].id);
			//fileUploadName = $("#findFileSize > input")[0].value.match(/[^\/\\]+$/);
			
			if(!uploadiframeflag){
			$("#uploadiframe").load(function(){
					uploadiframeflag = true;
				returnedString = document.getElementById( 'uploadiframe' ).contentWindow.document.body.innerText;
				
				if(parent_file_id>2 && $("label[for=file_input]").length > 1){
					$("label[for=file_input]").last().after("<label for='file_input' fid="+fileUploadId+ " class='title_attach_doc'>"+document.getElementById( 'uploadiframe' ).contentWindow.document.body.innerText+" Kb  <a href='javascript:removeFiles(\""+fileUploadId+"\")'>Remove</a> </label>");
				}
				else{
						$("<label for='file_input' fid="+fileUploadId+ " class='title_attach_doc'>"+document.getElementById( 'uploadiframe' ).contentWindow.document.body.innerText+" Kb  <a href='javascript:removeFiles(\""+fileUploadId+"\")'>Remove</a> </label>").insertAfter(".file_input:visible");
				}
				
				
				if(returnedString.indexOf('Failure File Upload') > -1){
					$("#fileTooLarge").html(fileUploadName +' not attached. Upto 25Mb of total attachments allowed.');	
					$("#fileTooLarge").show();
					$('label[fid='+$('input[type=file]:hidden')[0].id+'] > a')[0].click();
					//$("div[id=filebtn]").click(function(){ $("#fileTooLarge").hide(); });	
				}
				});
				
			}
			
			$("#findFileSize > input").insertAfter(".file_input:visible");
		}
		noFileChosenLabel();
	}
}

function noFileChosenLabel(){
	
	if($("input[type=file]").length > 1){
		$("span[class=no-file-selected]").addClass('hidden-input-value');
	}else{
		$("span[class='no-file-selected hidden-input-value']").removeClass('hidden-input-value');
	}
	
}

function addNewFileInput(){
	
	if(parent_file_id>1){
		$("<input id="+'file_input'+parent_file_id+ " class='file_input' onChange='javascript:attachMultiplFiles();' name="+'files'+ " type='file' aria-invalid='false'>").insertBefore("#file_input"+(parent_file_id-1));
	}
	else{
		$("<input id="+'file_input'+parent_file_id+ " class='file_input' onChange='javascript:attachMultiplFiles();' name="+'files'+ " type='file' aria-invalid='false'>").insertBefore("#file_input");
	}

	parent_file_id++;
	
}
function addNewFileInputIE(){
	
	if(parent_file_id>1){
		$("<input id="+'file_input'+parent_file_id+ " class='file_input' onChange='javascript:attachMultiplFiles();' name="+'files'+ " type='file' aria-invalid='false'>").insertAfter("#file_input"+(parent_file_id-1));
	}
	else{
		$("<input id="+'file_input'+parent_file_id+ " class='file_input' onChange='javascript:attachMultiplFiles();' name="+'files'+ " type='file' aria-invalid='false'>").insertAfter(".file_input");
	}

	parent_file_id++;
	
}

function validateFileSize(){
	var fileSizeTotal = 0;
	$("input[type=file]:hidden").each(function(){ fileSizeTotal += this.files[0].size;});
	fileSizeTotal = (fileSizeTotal/1024)/1024;
	if(fileSizeTotal > 25)
	{	fileName = $("input[type=file]:hidden")[0].files[0].name;
		$("#fileTooLarge").html(fileName + ' not attached. Upto 25Mb of total attachments allowed.');
		$("#fileTooLarge").show();
		$('label[fid='+$('input[type=file]:hidden')[0].id+'] > a')[0].click();
		$("div[class=filebtn]").click(function(){ $("#fileTooLarge").hide(); });
		}
}

function fileTypeValidation(){
	fileName = $("input[type=file]:hidden")[0].files[0].name;
	if(!validateFileType(fileName)){
		$("#fileTooLarge").html(fileName + ' is of Type that is not allowed for upload.');
		$("#fileTooLarge").show();
		$('label[fid='+$('input[type=file]:hidden')[0].id+'] > a')[0].click();
		$("div[class=filebtn]").click(function(){ $("#fileTooLarge").hide(); });
		return false;
	}
	return true;
}

function isFileApi(){
	  return $("<input type='file'>")    // create test element
	                 .get(0)               // get native element
	                 .files !== undefined; // check whether files property is not undefined
		
}



function removeFiles(idToBeRemoved){
	//console.log( "Remove files called for " + idToBeRemoved);
	$("label[fid="+idToBeRemoved+"]").remove();
	$("input[id="+idToBeRemoved+"]").remove();
	noFileChosenLabel();
	//parent_file_id--;
}


function validateFileType(fileName){
	var count = 0;
	var count = fileName.toString().match(/\./g);
	//console.log('Count Length' + count.length);
	if(count.length < 1){
		return false;
	}
	console.log('file name to lower Case ' + fileName.toString().toLowerCase());
	for(var i=0; i<fileExtension.length; i++){
			//console.log('File Extn' + fileExtension[i]);
			if(fileName.toString().toLowerCase().indexOf(fileExtension[i]) > -1){
			 return true;
			 }
	}

	return false;

}

$(document).click(function(e){ 
		
		if(!(e.target.nodeName.toString() == 'SELECT') && !(e.target.nodeName.toString() == 'LI')){  
				if((e.target.id.toString() == 'CustProdEmail') || (e.target.id.toString() == 'ServiceSubTypeEmail') || (e.target.id.toString() == 'CustProdChat')) {
				}else{
						$('div[id=CustProdEmail]').removeClass('active');
						$('div[id=CustProdEmail]').next().hide(); 
						$('div[id=ServiceSubTypeEmail]').removeClass('active');
						$('div[id=ServiceSubTypeEmail]').next().hide();
						$('div[id=CustProdChat]').removeClass('active');
						$('div[id=CustProdChat]').next().hide();
						}}
});


