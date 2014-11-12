//Validation Code @Author Ben Saini
//$( document ).ready(function() {
var deviceAgent = null;
var ios = null;
function validateForms(){	
			
	$("input[name=PhoneNumber]").formatter({
		'pattern': '({{999}}) {{999}}-{{9999}}',
		'persistent': false
	});
	
	$("input[name=PhoneNumberChat]").formatter({
		'pattern': '({{999}}) {{999}}-{{9999}}',
		'persistent': false
	});
	
	
	// Add US Phone Validation
	jQuery.validator.addMethod('phoneUS', function(phone_number, element) {
				phone_number = phone_number.replace(/\s+/g, ''); 
				return this.optional(element) || phone_number.length > 9 &&
					phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
			}, 'Please enter a valid phone number.');
			
	jQuery.validator.addMethod('phoneRequired', function(phone_number, element) {
				phone_number = phone_number.replace(/\s+/g, ''); 
				phone_number = phone_number.replace('(', '');
				phone_number = phone_number.replace(')', '');
				phone_number = phone_number.replace('-','');
				return this.optional(element) || phone_number.length > 0;
			}, 'Please enter a valid phone number.');
	
	jQuery.validator.addMethod('nameRequired', function(name, element) {
				return this.optional(element) || name.length > 0 &&
				name.match(/^[A-Za-z]+[- ']{0,1}[A-Za-z]*[- ']{0,1}[A-Za-z]*[- ']{0,1}[A-Za-z]*$/);
			}, 'Please enter a valid name');
	
	jQuery.validator.addMethod('emailRequired', function(emailaddress, element) {
				return this.optional(element) || emailaddress.length > 0 &&
					emailaddress.match(/^[.A-Za-z0-9_]+@[A-Za-z0-9_]+\.[A-Za-z]{2,4}$/);
			//		emailaddress.match(/^[A-Za-z]+$/);
			}, 'Email address is invalid');
	
	/*jQuery.validator.setDefaults({
		debug: true,
		success: "valid"
	});*/
	$("#emailForm").validate({
		ignore: 'input:hidden',
		errorClass: 'error-input',
		onfocusout: false,
		rules: {
			PhoneNumber: {
				required:true,
				phoneRequired : true,
				phoneUS: true
				 
			 },
			 emailAddress: {
				required: true,
				emailRequired: true,
				rangelength: [2, 50]
			 },
			 subject: {
				required: true,
				rangelength: [2, 50]
			 },
			body: {
					required: true
					},
			CustProd: {
					required: true
				},
			ServiceSubType:  {
					required: true
			}
			 
		},
		messages: {
					emailAddress: {
									required: "Email address field is required",
									emailRequired: "Email address is invalid"
								   },
					subject: {
								required: "Subject field is required"
							 },
					body: {
							required: "Enter your question field is required"
							},
					CustProd: {
									required: "Product field is required"
									},
					ServiceSubType:  {
										required: "Sub product field is required"
									 },
					PhoneNumber: {
									phoneRequired : "Phone number on your account field is required",
									phoneUS: "Phone number entered is invalid",
									required: "Phone number on your account field is required"
									}
				},
					highlight: function (element, errorClass, validClass) {
					$("#emailForm").find("#"+element.id+"").addClass(errorClass);
					$(element.form).find("label[for=" + element.id + "]")
					.addClass("error-label");
					
				},
				unhighlight: function (element, errorClass, validClass) {
					console.log(element.id);
					$(element.form).find("label[for=" + element.id + "]").removeClass("error-label");
					$("#emailForm").find("#"+element.id+"").removeClass(errorClass);
					
				},		
				
		 
		showErrors: function(errorMap, errorList) {
				      this.defaultShowErrors();
					  $("#messageBox1").children("*").find("*").each(function(){ $(this).css('border','0px'); });
					  $("#messageBox1").children("*").find("*").each(function(){ $(this).css('background-color','#FFFFE0'); });
					  $("#messageBox1").children("*").find("*").each(function(){ $(this).css('color','#45bea7'); 
					  $("#messageBox1").children("*").find("*").each(function(){ if($(this).text() === ''){ $(this).hide(); }});
					  });
				},
		
		 errorContainer: "#messageBox1",
		 errorLabelContainer: "#messageBox1 ul",
		 
		 wrapper: "li",
		
		errorPlacement: function(error, element){
			//console.log("Error - " +error);
		},
		submitHandler: function(form){
			$("#submittingFormMsg").show();
			//console.log("Form is success!");
			//console.log(faqsDisplayed);
			if(faqsDisplayed){
				emailFormSubmit();
			}else{
				fetchFaqs('email');
			}
			
			try{
				reporting.trackClick(this,'Email Us | Continue');
			
			}catch(err){
				console.log('Could not do reporting on Email Us /Continue - inform CAS-Asif');
			}
		},
		invalidHandler: function(form){
			console.log("Form did not validate");
		}
	});
	
$("#chatForm").validate({
	ignore: 'input:hidden, select[name=ServiceSubType]',
			errorClass: 'error-input',
			onfocusout: false,
			rules: {
				custFirstName : { 
					required : true,
					nameRequired : true
				},
                		custLastName:{
	                    		required: true,
					nameRequired : true
	            		},
				CustProdChat : {
								required: true
				},			
				PhoneNumberChat: {
					phoneRequired : true,
					phoneUS: true,
					required: true
					 
				 },
				 emailAddressChat: {
					required: true,
					emailRequired: true,
					rangelength: [2, 50]
				 },
				 subjectChat: {
					required: true,
					rangelength: [2, 50]
				 }
			},
			messages: {
						emailAddressChat: {
										required: "Email address field is required",
										emailRequired: "Email address is invalid"
									   },
						custFirstName: {
										required: "First name field is required",
										nameRequired : "First name is invalid"
									},
						custLastName: {
										required: "Last name field is required",
										nameRequired : "Last name is invalid"
									},
						subjectChat: {
									required: "Enter your question field is required"
								 },
						CustProdChat: {
										required: "Chat request type field is required"
										},
						PhoneNumberChat: {
										required: "Phone number on your account field is required",
										phoneUS: "Phone number entered is invalid" ,
										phoneRequired : "Phone number on your account field is required"
										}
					},
				highlight: function (element, errorClass, validClass) {
					$("#chatForm").find("#"+element.id+"").addClass(errorClass);
					$(element.form).find("label[for=" + element.id + "]")
					.addClass("error-label");
					
				},
				unhighlight: function (element, errorClass, validClass) {
					$("#chatForm").find("#"+element.id+"").removeClass(errorClass);
					$(element.form).find("label[for=" + element.id + "]")
					.removeClass("error-label");
				},
			 
			showErrors: function(errorMap, errorList) {
					      this.defaultShowErrors();
						  $("#messageBox2").children("*").find("*").each(function(){ $(this).css('border','0px'); });
						  $("#messageBox2").children("*").find("*").each(function(){ $(this).css('background-color','#FFFFE0'); });
						  $("#messageBox2").children("*").find("*").each(function(){ $(this).css('color','#45bea7'); });
						  $("#messageBox2").children("*").find("*").each(function(){ if($(this).text() === ''){ $(this).hide(); }});
						  
					},
			
			 errorContainer: "#messageBox2",
			 errorLabelContainer: "#messageBox2 ul",
			 
			 wrapper: "li",
			
			errorPlacement: function(error, element){
				//console.log("Error - " +error);
			},
			submitHandler: function(form){
				console.log("Chat Form is success!");
				//chatFormSubmit();
				//if(faqsDisplayed){
				deviceAgent = navigator.userAgent;
				// Set var to iOS device name or null
				ios = deviceAgent.toLowerCase().match(/(iphone|ipod|ipad)/);
				if(!ios){
					popWin = window.open('', '_blank', 'location=0,menubar=0,status=0,scrollbars=0,width=330,height=515,scrollbars=yes');
				}	
				chatFormSubmit();
				//diplayPopup(popWin);	
				//}else{
				//	fetchFaqs('chat');
				//}
			},
			invalidHandler: function(form){
				console.log("Chat Form did not validate");
			}
	});

}


