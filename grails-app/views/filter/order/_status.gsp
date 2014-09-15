
<%@ page import="com.sapienter.jbilling.server.order.db.OrderStatusDAS" %>


<div id="${filter.name}">
    <span class="title <g:if test='${filter.value}'>active</g:if>"><g:message code="filters.${filter.field}.title"/></span>
    <g:remoteLink class="delete" controller="filter" action="remove" params="[name: filter.name]" update="filters"/>
    
    <div class="slide">
        <fieldset>
            <div class="input-row">
                <div class="select-bg">
                    <g:select name="filters.${filter.name}.integerValue"
                              value="${filter.integerValue}"
                              from="${new OrderStatusDAS().findAll()}"
                              optionKey="id" optionValue="description"
                              noSelection="['': message(code: 'filters.status.empty')]"/>

                </div>
                <label for="filters.${filter.name}.stringValue"><g:message code="filters.status.label"/></label>
            </div>
        </fieldset>
    </div>
</div>

