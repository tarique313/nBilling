%{--
  JBILLING CONFIDENTIAL
  _____________________

  [2003] - [2012] Enterprise jBilling Software Ltd.
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Enterprise jBilling Software.
  The intellectual and technical concepts contained
  herein are proprietary to Enterprise jBilling Software
  and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden.
  --}%

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <g:render template="/layouts/includes/head"/>
    <g:javascript library="panels"/>
    <%--<g:javascript library="menu"/>--%>
    <g:javascript library="cssmenu"/>
    

    <script type="text/javascript">
        function renderRecentItems() {
            $.ajax({
                url: "${resource(dir:'')}/recentItem",
                global: false,
                success: function(data) { $("#recent-items").replaceWith(data) }
            });
        }

        $(document).ajaxSuccess(function(e, xhr, settings) {
           // renderRecentItems();
        });
    </script>

    <g:layoutHead/>
</head>
<body>
<div id="wrapper">
    <g:render template="/layouts/includes/header"/>

    <div id="main">
        <g:render template="/layouts/includes/breadcrumbs"/>
        
        <%--
        
       <div id="left-column">
       
        <div class="menu-items">
        
        <ul class="list">

                 menu 
 <div id='cssmenu'>
 	<ul>
 		<sec:access url="/customer/list">
		 		 	<li class="">
		       		<a href="/nbilling/order/create"><span><g:message code="menu.link.check"/></span><em></em></a>        
		  			</li>	
		 </sec:access>
 	 
 	 

 	 
 <li class="active has-sub"><a href="#"><span>Customer</span></a>
   <ul>
   
   
   
      <sec:access url="/customer/list">
             	<li class="${controllerName == 'customer' ? 'has-sub' : ''}">
                    <g:link controller="customer"><span><g:message code="menu.link.customers"/></span><em></em></g:link>
                </li>
       </sec:access>
       
        <sec:access url="/customer/edit">
             	<li class="${controllerName == 'customer' ? 'has-sub' : ''}">
                    <g:link controller="customer"><span><g:message code="menu.link.addcustomers"/></span><em></em></g:link>
                </li>
       </sec:access>
      

      
      <li class='has-sub'><a href="/nbilling/customer/edit"><span>Add Customer</span></a></li>
   </ul>
 </li>
  <sec:access url="/product/list">
                <li class="${controllerName == 'product' ? 'active' : ''}">
                    <g:link controller="product"><span><g:message code="menu.link.products"/></span><em></em></g:link>
                </li>
            </sec:access>
  
  <sec:access url="/order/list">
  <li class="${controllerName == 'order' ? 'active' : ''}">
                    <g:link controller="order"><span><g:message code="menu.link.orders"/></span><em></em></g:link>
                </li>
  </sec:access>
   <sec:access url="/invoice/list">
                <li class="${controllerName == 'invoice' ? 'has-sub' : ''}">
                    <g:link controller="invoice"><span><g:message code="menu.link.invoices"/></span><em></em></g:link>
                </li>
            </sec:access>
            <sec:access url="/payment/list">
                <li class="${controllerName == 'payment' ? 'active' : ''}">
                    <g:link controller="payment"><span><g:message code="menu.link.payments.refunds"/></span><em></em></g:link>
                </li>
            </sec:access>
            <sec:access url="/billing/list">
                <li class="${controllerName == 'billing' ? 'active' : ''}">
                    <g:link controller="billing"><span><g:message code="menu.link.billing"/></span><em></em></g:link>
                </li>
            </sec:access>
            </ul>
 
 		</div>
 		
 		 End CSSMENU
 </div>
 
 --%><%-- End Left Column--%>
 
 
 	<!-- content columns -->
        <div class="columns-holder">
            <g:render template="/layouts/includes/messages"/>
            <g:render template="/layouts/includes/errors"/>

            <!-- viewport of visible columns -->
            <div id="viewport">
                <div class="column panel">
                    <div id="column1" class="column-hold">
                        <g:pageProperty name="page.column1"/>
                    </div>
                </div>

                <div class="column panel">
                    <div id="column2" class="column-hold">
                        <g:pageProperty name="page.column2"/>
                    </div>
                </div>
            </div>

            <!-- template for new column-->
            <div id="panel-template" class="column panel">
                <div class="column-hold"></div>
            </div>
 </div><%-- End MAIN id --%>
</body>
</html>
