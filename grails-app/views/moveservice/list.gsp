<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="layout" content="main" />
</head>
<body>
	<div class="heading">
		<strong><em><g:message code="moveservice.messsage.show" /></em></strong>
	</div>
	<div class="form-edit">
		<div class="form-hold">
			<img class="centeri"
				src="${resource(dir:'images', file:'moving_header.jpg')}" />
			

				<div id="fat-menu">
					 <div class="first-column-sep">
						<h2>Request Service Order</h2><br />
						<p>Our moving service</p><br />
						<p>At your service 24 hours a day</p>
						<br />
						<br />
						
							<g:link  controller="product" action="list" class="submit_tarique">
							<span><g:message code="button.service.moveservice"/></span></g:link>
		                
						</div>
						<div class="column-sep">
							<h2>Request Service Order</h2><br />
							<p>Our moving service</p><br />
							<p>At your service 24 hours a day</p>
							<br />
							<br />
							
								<g:link controller="product" action="list" class="submit_tarique" >
								<span><g:message code="button.service.moveservice"/></span></g:link>
								
						</div>
						<div class="column-sep">
						<h2>Request Service Order</h2><br />
							<p>Our moving service</p><br />
							<p>At your service 24 hours a day</p>
							<br />
							<br />
							
								<g:link controller="product" action="list" class="submit_tarique"><span>
								<g:message code="button.service.moveservice"/></span></g:link>					
						
						</div>
					

				</div>
						<div class="buttons" style="margin-top: 30px;">
		                    <ul>
		                    <li>
		                           
		                         <g:link controller="customer" action="list" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
		                        </li>
		                        
		                    </ul>
		                </div>
		</div>
	</div>
</body>
</html>