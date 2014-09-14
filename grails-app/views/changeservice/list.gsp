<html>
<head>
<meta name="layout" content="main" />
<style>
table{
horizontal-align: middle;
margin-left: 436px;
}
table, th, td {
	border: 1px white;
	border-collapse: collapse;
	
	
}

th, td {
	padding: 5px;
}
</style>
</head>
<body>
	<div class="heading">
		<strong><em><g:message code="services.change.plan" /></em></strong>
	</div>
	<div class="form-edit">
		<div class="form-hold">
		   
   
			<table style="width: 640px">
				<tr>
					<th>Service Name</th>
					<th>Price</th>
				</tr>
				<tr>
					<td>
					<g:applyLayout name="form/radio">
					
						<g:radio name="changeService"/><g:message code="services.details.radio1" />
						</g:applyLayout>
					</td>
					<td align="center">$150</td>
				</tr>
				<tr>
					<td>
					<g:applyLayout name="form/radio">
					<g:radio name="changeService"/><g:message code="services.details.radio2" />
					</g:applyLayout>
					</td>
					<td align="center">$100</td>
				</tr>
				<tr>
					<td>
					<g:applyLayout name="form/radio">
					<g:radio name="changeService"/><g:message code="services.details.radio3" />
					</g:applyLayout>
					</td>
					<td align="center">$50</td>
				</tr>
				<tr>
					<td>
					<g:applyLayout name="form/radio">
					<g:radio name="changeService"/><g:message code="services.details.radio4" />
					</g:applyLayout>
					</td>
					<td align="center">$40</td>
				</tr>
				<tr>
					<td>
					<g:applyLayout name="form/radio">
					<g:radio name="changeService"/><g:message code="services.details.radio5" />
					</g:applyLayout>
					</td>
					<td></td>
				</tr>
			</table>
			
			
				<div class="buttons" style="margin-top: 30px;">
		                    <ul>
		                        <li>
		                            <g:link controller="product" action="list" class="submit change"><span><g:message code="button.service.changeplan"/></span></g:link>
		                        </li>
		                        <li>
		                            <g:link action="list" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
		                        </li>
		                        
		                    </ul>
		                </div>
		</div>
	</div>
</body>
</html>
