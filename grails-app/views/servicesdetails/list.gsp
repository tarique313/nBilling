<%@ page import="com.sapienter.jbilling.server.user.UserDTOEx; com.sapienter.jbilling.server.user.contact.db.ContactTypeDTO; com.sapienter.jbilling.server.user.db.CompanyDTO; com.sapienter.jbilling.server.user.permisson.db.RoleDTO; com.sapienter.jbilling.common.Constants; com.sapienter.jbilling.server.util.db.LanguageDTO" %>
<%@ page import="com.sapienter.jbilling.server.util.db.CountryDTO" %>
<html>
	<head>
	 <meta name="layout" content="main" />
	
	</head>
		<body>
		<div class="heading"><strong><em><g:message code="services.details.heading"/></em></strong></div>
			<div class="form-edit">
			<g:set var="isNew" value="${!user || !user?.userId || user?.userId == 0}"/>
				<div class="form-hold">
					<fieldset>	
						<div class="form-columns" style="margin-right: 80px;">
							<div class="column">
							&nbsp;&nbsp;<h1><g:message code="services.details.myplan"/></h1>
							<br>
							<br>
							<h2><g:message code="services.details.internet"/></h2>
							
							
							<h3><g:message code="services.details.plandetails"/></h3>
							<li>
								<p><g:message code="services.details.detailsone"/></p>
							</li>
							<li>
								<p><g:message code="services.details.detailstwo"/></p>	
							</li>
							
							<br>
							
							<hr>
							<h2><g:message code="services.details.phone"/></h2>
							
							
							<h3><g:message code="services.details.plandetails"/></h3>
							<li>
								<p><g:message code="services.details.phonedetailsone"/></p>
							</li>
							<li>
								<p><g:message code="services.details.phonedetailstwo"/></p>	
							</li>
							<br>
							</div>
		                </div>
									<div class="buttons" style="margin-top: 30px;">
		                    <ul>
		                        <li>
		                            <g:link controller="changeservice" class="submit change"><span><g:message code="button.change.service"/></span></g:link>
		                        </li>
		                        <li>
		                            <g:link action="list" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
		                        </li>
		                        
		                    </ul>
		                </div>
					</fieldset>
					
				
				</div>
			</div>
			 <div id="serviceDetails" class="box-cards ${serviceDetails ? 'box-cards-open' : ''}">
                    <div class="box-cards-title">
                        <a class="btn-open"><span><g:message code="service.boxcard.title"/></span></a>
                    </div>
                    <div class="box-card-hold">
                        <div class="form-columns">
                            <div class="column">
                                <span><g:message code="service.boxcard.choicebundleone"/></span>
                                <span><g:message code="service.boxcard.choicebundletwo"/></span>
                                <hr>
                                <span><g:message code="service.boxcard.totalserviceprice"/></span>
                            </div>

                        </div>
                    </div>
                </div>
		</body>
</html>