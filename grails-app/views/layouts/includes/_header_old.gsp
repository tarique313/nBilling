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

<%@ page import="com.sapienter.jbilling.common.Constants; jbilling.SearchType" %>

<!-- header -->
<div id="header">
    <h1><a href="${resource(dir:'')}"></a></h1>
   
    <div class="search">        
	<g:form controller="search" name="search-form">
            <fieldset>
                <input type="image" class="btn" src="${resource(dir:'images', file:'icon-search.gif')}" onclick="$('#search-form').submit()"/>
                <div class="input-bg">                    
                    <g:textField name="id" value="${cmd?.id ?: message(code:'search.title')}" class="default"/>
                    <a href="#" class="open"></a>
                    <div class="popup">
                        <div class="top-bg">
                            <div class="btm-bg">
                                <sec:access url="/customer/list">
                                    <div class="input-row">
                                        <g:radio id="customers" name="type" value="CUSTOMERS" checked="${!cmd || cmd?.type?.toString() == 'CUSTOMERS'}"/>
                                        <label for="customers"><g:message code="search.option.customers"/></label>
                                    </div>
                                </sec:access>
                                <sec:access url="/order/list">
                                    <div class="input-row">
                                        <g:radio id="orders" name="type" value="ORDERS" checked="${cmd?.type?.toString() == 'ORDERS'}"/>
                                        <label for="orders"><g:message code="search.option.orders"/></label>
                                    </div>
                                </sec:access>
                                <sec:access url="/invoice/list">
                                    <div class="input-row">
                                        <g:radio id="invoices" name="type" value="INVOICES" checked="${cmd?.type?.toString() == 'INVOICES'}"/>
                                        <label for="invoices"><g:message code="search.option.invoices"/></label>
                                    </div>
                                </sec:access>
                                <sec:access url="/payment/list">
                                    <div class="input-row">
                                        <g:radio id="payments" name="type" value="PAYMENTS" checked="${cmd?.type?.toString() == 'PAYMENTS'}"/>
                                        <label for="payments"><g:message code="search.option.payments"/></label>
                                    </div>
                                </sec:access>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
<div id="navigation">
    <ul><%--
        <li><g:message code="topnav.greeting"/> <sec:loggedInUserInfo field="plainUsername"/></li>
        --%><li>
            <g:if test="${session['main_role_id'] == Constants.TYPE_CUSTOMER}">
                <g:link controller="customer" action="edit" id="${session['user_id']}">
                    <img src="${resource(dir:'images', file:'icon25.gif')}" alt="account" />
                    <g:message code="topnav.link.account"/>
                </g:link>
            </g:if>
            <g:else>
                <g:link controller="user" action="edit" id="${session['user_id']}">
                    <img src="${resource(dir:'images', file:'icon25.gif')}" alt="account" />
                    <g:message code="topnav.link.account"/>
                </g:link>
            </g:else>
        </li><%--
        <li>
            <a href="http://www.jbilling.com/professional-services/training">
                <img src="${resource(dir:'images', file:'icon26.gif')}" alt="training" />
                <g:message code="topnav.link.training"/>
            </a>
        </li>
        --%>
        <li>
            <a href="http://www.nksoft.com">
                <img src="${resource(dir:'images', file:'icon27.gif')}" alt="help" />
                <g:message code="topnav.link.help"/>
            </a>
        </li>
        <li>
            <g:link controller='logout'>
                <img src="${resource(dir:'images', file:'icon28.gif')}" alt="logout" /><g:message code="topnav.link.logout"/>
            </g:link>
        </li>
    </ul>
 </div> 
        
    <div id="left-column" style="margin-top: 12px;">
   	 <%--
         select the current menu item based on the controller name 
         
        --%>
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
                    <a href="/nbilling/customer/edit"><span><g:message code="menu.link.addcustomers"/></span></a>
                </li>
       </sec:access>
      

      
      <%--<li class='has-sub'><a href="/nbilling/customer/edit"><span>Add Customer</span></a></li>
   --%></ul>
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
    </div>
</div>
