<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Email With Attachment</title>
    <!-- <link rel="stylesheet" type="text/css" href="../Resources/StyleSheet.css"/> -->
<style>
.error {
	color: #ff0000;
}
 
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>

<form:form modelAttribute="uploadForm" name="emailFormWithAttachment" method="post" enctype="multipart/form-data" action="http://localhost:8080/cvContactUs/rest/sendEmailWithAttachment">
    <form:errors path="*" cssClass="errorblock" element="div" />
    <table style="width:100%" cellspacing="0" cellpadding="2">
        <tr>
            <td>
                <table >
                    <tr >
                        <td style="width:617px">Email over the Web sample</td>
                        <td style="width:auto" ></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td class="samplesSampleParagraph">
                Sample of Email submission over the web based on the PSDK Java API classes and JSP pages.
            </td>
        </tr>
        <tr>
            <td>
              <table style="width:617px" border="0" >
                <tr>
                   <td></td>
                   <td></td>
                   <td style="width:6px; vertical-align: middle;"></td>
                </tr>

				<tr>
					<td   >First name:</td>
					<td><input class="samplesFieldStyle" type="text" name="firstName" value=""></td>
                    <td style="width:6px; vertical-align: middle;"><font class="samplesMandatoryMark">*</font></td>
				</tr>

				<tr>
					<td   >Last name:</td>
					<td><input class="samplesFieldStyle" type="text" name="lastName" value=""></td>
                    <td style="width:6px; vertical-align: middle;"><font class="samplesMandatoryMark">*</font></td>
				</tr>
				<tr>
					<td   >Email address:</td>
					<td><input class="samplesFieldStyle" type="text" name="emailAddress" value=""></td>
                    <td style="width:6px; vertical-align: middle;"><span class="samplesMandatoryMark">*</span></td>
				</tr>

				<tr>
					<td   >Reply from:</td>
					<td><input class="samplesFieldStyle" type="text" name="replyFrom" value=""></td>
                    <td></td>
				</tr>
				
				<tr>
					<td   >Interaction id:</td>
					<td><input class="samplesFieldStyle" type="text" name="id" value=""></td>
                    <td></td>
				</tr>

				<tr>
					<td   >Subject:</td>
                    <td><input class="samplesFieldStyle" type="text" name="subject" id="subject" value="" ></td>                        
                    <td style="width:6px; vertical-align: middle;"><span class="samplesMandatoryMark">*</span></td>
				</tr>
				<tr>
					<td   >Attachment1:</td>
                    <td><input name="files" type="file" value="Browse"/></td>                        
                    <td style="width:6px; vertical-align: middle;"><span class="samplesMandatoryMark">*</span></td>
				</tr>
				<tr>
					<td   >Attachment2:</td>
                    <td><input name="files" type="file" value="Browse"/></td>                        
                    <td style="width:6px; vertical-align: middle;"><span class="samplesMandatoryMark">*</span>
                    <form:errors path="files" cssClass="error" />
                    </td>
				</tr>
				<tr>
                    <td style="width:150px; vertical-align: middle;"   ></td>
                    <td colspan=2>
						<textarea style="height:200px;" rows="10" cols="20" name="body"></textarea>
					</td>
				</tr>
                <tr>
                  <td   ></td>
                  <td style="width:511px; vertical-align: middle; text-align:left" colspan="2">
                      <table>
                          <tr align="right">
                              <input type="hidden" name="action" value="">
                              <td>
                              <input type="submit" value="Send" />
                              </td>
                              <td>
                              <input type="button" onclick="" value="Clear">
                              </td>                              
                          </tr>
                      </table>
                  </td>
                  <td style="width:6px; vertical-align: middle;"></td>
                </tr>

				<tr>
					<td colspan=3>
                        <h5 class="samplesSampleNameTitle">
                            <div id="ServerMessage" name="ServerMessage"></div>
                        </h5>
                    </td>
				</tr>
              </table>
            </td>
        </tr>

    </table>
</form:form>

</body>
</html>