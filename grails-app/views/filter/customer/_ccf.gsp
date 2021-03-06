<%@ page import="com.sapienter.jbilling.server.user.contact.db.ContactFieldTypeDTO" %>
<%@ page import="com.sapienter.jbilling.server.user.db.CompanyDTO" %>
<%@ page import="com.sapienter.jbilling.server.util.Constants" %>

<div id="${filter.name}">
    <span class="title <g:if test='${filter.value}'>active</g:if>"><g:message code="filters.${filter.field}.title"/></span>
    <g:remoteLink class="delete" controller="filter" action="remove" params="[name: filter.name]" update="filters"/>
    
    <div class="slide">
        <fieldset>
            <div class="input-row">
                <div class="select-bg" style="float:left;">
                    <g:set var="company" value="${CompanyDTO.get(session['company_id'])}"/>
                    <g:select style="float:left;"  
                            name="contactFieldTypes" 
                            from="${(company.contactFieldTypes << new ContactFieldTypeDTO()).sort{it.id}}" 
                            optionKey="id" optionValue="description"
                            noSelection="['': message(code: 'filters.contactFieldTypes.empty')]" />
                </div>
                <div class="input-bg">
                    <g:textField name="filters.${filter.name}.stringValue" value="${filter.stringValue}" class="{validate:{ maxlength: 50 }}"/>
                </div>
                <label for="filters.${filter.name}.stringValue"><g:message code="filters.value.label"/></label>
            </div>
        </fieldset>
    </div>
</div>

