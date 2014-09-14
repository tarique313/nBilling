<%@page import="javax.jms.Session"%>
<%@ page import="com.sapienter.jbilling.server.user.UserDTOEx; com.sapienter.jbilling.server.user.contact.db.ContactTypeDTO; com.sapienter.jbilling.server.user.db.CompanyDTO; com.sapienter.jbilling.server.user.permisson.db.RoleDTO; com.sapienter.jbilling.common.Constants; com.sapienter.jbilling.server.util.db.LanguageDTO" %>

<html>
<head>
    <meta name="layout" content="main" />
       <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
 		</script>
 		
 	<script type="text/javascript">

		
		 function initialize()
		 {


				 var geocoder = new google.maps.Geocoder();
				 addr_array = ["<%=citystreet%>", "<%=citydata%>"];
				 var address = addr_array.join(",");
				
				 geocoder.geocode( { 'address': address}, function(results, status) {
				
				 if (status == google.maps.GeocoderStatus.OK) {
				     var latitude = results[0].geometry.location.lat();
				     var longitude = results[0].geometry.location.lng();
				     console.log(latitude);
				     console.log(longitude);
				     } 
				 //}); 
	
				var myCenter=new google.maps.LatLng(latitude,longitude);
	
	
	
				 
			 var mapProp = {
			   center:myCenter,
			   zoom:15,
			   mapTypeId:google.maps.MapTypeId.ROADMAP
			   };
			
			 var map=new google.maps.Map(document.getElementById("google_map"),mapProp);
			
			 var marker=new google.maps.Marker({
			   position:myCenter,
			   });
			
			 marker.setMap(map);
			});
		 }
		
		 google.maps.event.addDomListener(window, 'load', initialize);	 
	</script>
	
	<script>
		$(function(){
			$("#submit_button").click(function(){
				console.log("click worked");
				
				get_unique_info();
				$("#data-form").submit();
				});
			});

	</script>
  
</head>

<body>

<div class="task">
		<div style="width: 60%; height: inherit; margin: 0px; padding: 0px; float: left;">
		   <p style="font-size: x-large; color: green;"> Good news, FTTH Enchanted Light is available at this address!</p>
		  	
		  	<p style="margin-left: 20px; font-size: medium;">Street:${address_2}</p>
		  	<p style="margin-left: 20px; font-size: medium;">City:${citydata}</p>
			
		</div>
		
	</div>
	<g:form controller="customer" name="data-form" action="edit">
	
	
	 <fieldset>
	 <input type="hidden" id="add_1" value="${address_1}">
	 <input type="hidden" id="add_2" value="${address_2}">
	 <input type="hidden" id="city" value="${citydata}">
	 <input type="hidden" id="state" value="${state_addr}">
	 <input type="hidden" id="zip" value="${zip_code}">
	<table style="margin-left: 30px;">
	<tr>
		<td>
			<g:applyLayout name="form/text">
	        <content tag="label"><g:message code="prompt.phone.number"/></content>
	        <content tag="label.for">contact-${contactType?.id}.phoneCountryCode</content>
	        <span>
	            <g:textField class="field" id="phn_1" name="contact-${contactType?.id}.phoneCountryCode" value="${contact?.phoneCountryCode}" maxlength="3" size="2"/>
	            -
	            <g:textField class="field" id="phn_2" name="contact-${contactType?.id}.phoneAreaCode" value="${contact?.phoneAreaCode}" maxlength="5" size="3"/>
	            -
	            <g:textField class="field" id="phn_3" name="contact-${contactType?.id}.phoneNumber" value="${contact?.phoneNumber}" maxlength="10" size="8"/>
	        </span>
	   	   </g:applyLayout>
	   	   </td>
	</tr>
	<tr>
		<td>
		<g:applyLayout name="form/text">
			<content tag="label"><g:message code="prompt.email"/></content>
	        <content tag="label.for"></content>
		
			<g:textField class="field" id= "unique_email"  name="contact-${contactType?.id}.email" value="${contact?.email}"  style="margin-left:51px;"/>
		</g:applyLayout>
		</td>
	</tr>
	</table>
	
		
      <div id="google_map" style="width: 1200px; height: 470px; margin-top: 50px; margin-left: 96px">

     </div>
   
	<div class="buttons" style="margin-top: 30px;">
		 <ul>
		     <li>
		       <a id="submit_button" class="submit order"><span><g:message code="availablity.button.continue"/></span></a>
		     </li>
		     <li>
		        <g:link action="/nbilling/customer/list" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
		     </li>
		 </ul>
	</div>
	
    </fieldset>
   
   
    </g:form>

</body>
</html>