<%@ page import="com.sapienter.jbilling.server.user.UserDTOEx; com.sapienter.jbilling.server.user.contact.db.ContactTypeDTO; com.sapienter.jbilling.server.user.db.CompanyDTO; com.sapienter.jbilling.server.user.permisson.db.RoleDTO; com.sapienter.jbilling.common.Constants; com.sapienter.jbilling.server.util.db.LanguageDTO" %>
<html>
	<head>
	 <meta name="layout" content="main" />
	

	</head>
		<body>
			<div class="form-edit">
				<div class="form-hold">
				<g:form controller="check" name="check-form">
					<fieldset>	
						<div class="form-columns" style="margin-right: 80px;">
							<div class="column">
							<table style="margin-left: 150px;">
							<tr>
								<td>
								<g:applyLayout name="form/checkbox">
		                            <content tag="label"><g:message code="availablity.check.address"/></content>
		                            <content tag="label.for">availability.check</content>
		                            <g:checkBox id="addr" class="cb checkbox" name="availability.addr" checked=""/>
	              			  </g:applyLayout>
	
								</td>
								
								<td>
					 			<g:applyLayout name="form/checkbox">
					                 <content tag="label"><g:message code="Kit Carson Customer"/></content>
					                 <content tag="label.for">availability.check</content>
					                 <g:checkBox id="kit" class="cb checkbox" name="availability.addr2" checked=""/>
					             </g:applyLayout>
					             </td>
					             
					             </tr>
				               </table>
				               
				               
								<g:applyLayout name="form/input">
									<content tag="label"><g:message code="availablity.street.address"/></content>
									<content tag="label.for">street.address</content>
									<g:textField id="street" class="field" name="street" required="true"  value="${cmd?.street}" size="40"/>
								</g:applyLayout>
								
								
								<g:applyLayout name="form/input">
				                 <content tag="label"><g:message code="availablity.apt.unit"/></content>
				                 <content tag="label.for">availablity.apt.unit</content>
				               	 <g:textField id="apt" class="field" name="apt" value="${cmd?.apt}" size="20"/>
				             </g:applyLayout>
				             
				             <g:applyLayout name="form/input">
				                 <content tag="label"><g:message code="availablity.city.name"/></content>
				                 <content tag="label.for">availablity.city.name</content>
				               	 <g:textField id="city" class="field" name="city" required="true"  value="${cmd?.city}" size="40"/>
				             </g:applyLayout>
				             
				             <%--<g:applyLayout name="form/input">
				                 <content tag="label"><g:message code="availablity.state.name"/></content>
				                 <content tag="label.for">availablity.state.name</content>
				               	 <g:textField id="state" class="field" name="state" value="${cmd?.state}" size="30"/>
				             </g:applyLayout>
				             
				             --%>
				             <g:applyLayout name="form/select">
						        <content tag="label"><g:message code="availablity.state.name"/></content>
						        <content tag="label.for">availablity.state.name</content>
								<g:select id="state" class="field" name="state"
						        		  value="${cmd?.state}"
						                  from="${[
											  'Alabama':'Alabama',
											  'Alaska':'Alaska',
											  'Delaware':'Delaware',
											  'District of Columbia':'District of Columbia',
											  'Florida':'Florida',
											  'Arizona':'Arizona',
											  'Arkansas':'Arkansas',
											  'California':'California',
											  'Colorado':'Colorado',
											  'Connecticut':'Connecticut',
											  'Georgia':'Georgia',
											  'Guam':'Guam',
											  'Hawaii':'Hawaii',
											  'Idaho':'Idaho',
											  'Illinois':'Illinois',
											  'Indiana':'Indiana',
											  'Iowa':'Iowa',
											  'Kansas':'Kansas',
											  'Kentucky':'Kentucky',
											  'Louisiana':'Louisiana',
											  'Maine':'Maine',
											  'Maryland':'Maryland',
											  'Massachusetts':'Massachusetts',
											  'Michigan':'Michigan',
											  'Minnesota':'Minnesota',
											  'Mississippi':'Mississippi',
											  'Missouri':'Missouri',
											  'Montana':'Montana',
											  'Nebraska':'Nebraska',
											  'Nevada':'Nevada',
											  'New Hampshire':'  New Hampshire',
											  'New Jersey':'New Jersey',
											  'New Mexico':'New Mexico',
											  'New York':'New York',
											  'North Carolina':'North Carolina',
											  'North Dakota':'North Dakota',
											  'Ohio':'Ohio',
											  'Oklahoma':'Oklahoma',
											  'Oregon':'Oregon',
											  'Pennsylvania':'Pennsylvania',
											  'Puerto Rico':'Puerto Rico',
											  'Rhode Island':'Rhode Island',
											  'South Carolina':'South Carolina',
											  'South Dakota':'South Dakota',
											  'Tennessee':'Tennessee',
											  'Texas':'Texas',
											  'Utah':'Utah',
											  'Vermont':'Vermont',
											  'Virginia':'Virginia',
											  'Washington':'Washington',
											  'West Virginia':'West Virginia',
											  'Wisconsin':'Wisconsin',
											  'Wyoming':'Wyoming']}"
						                  optionKey="key"
										  optionValue="value"
						                  noSelection="['': message(code: 'default.no.selection')]"
						                   />
    						</g:applyLayout>
				             
				             
				             <g:applyLayout name="form/input">
				                 <content tag="label"><g:message code="availablity.zip.code"/></content>
				                 <content tag="label.for">availablity.zip.code</content>
				               	 <g:textField id="zip" class="field" name="zip" value="${cmd?.zip}" size="10"/>
				             </g:applyLayout>
				             
				             
				             <g:applyLayout name="form/checkbox">
		                            <content tag="label"><g:message code="This is a business address"/></content>
		                            <content tag="label.for">availability.check</content>
		                            <g:checkBox class="cb checkbox" name="availability.check" checked=""/>
		                     </g:applyLayout>
		   				 <g:applyLayout name="form/input">
			                 <content tag="label"><g:message code="availablity.electric.account"/></content>
			                 <content tag="label.for">availablity.electric.account</content>
			               	 <g:textField id="electric" class="field" name="electric.account" value="" size="30"/>
			             </g:applyLayout>
			             
			              <g:applyLayout name="form/input">
			                 <content tag="label"><g:message code="availablity.meter.no"/></content>
			                 <content tag="label.for">availablity.meter.no</content>
			               	 <g:textField id="meter" class="field" name="meter.no" value="" size="30"/>
			             </g:applyLayout>
			
			        
		                </div>
						</div>
						<div class="buttons" style="margin-top: 30px;">
		                    <ul>
		                        <li>
		                            <a onclick="$('#check-form').submit()" class="submit order"><span><g:message code="availablity.button.check"/></span></a>
		                        </li>
		                        <li>
		                            <g:link action="list" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
		                        </li>
		                    </ul>
		                </div>
					</fieldset>
					
					</g:form>
				
				</div>
			</div>
		</body>
</html>