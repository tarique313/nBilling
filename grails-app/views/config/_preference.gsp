
<%@ page import="com.sapienter.jbilling.server.util.Constants" %>

<g:hiddenField name="type.id" value="${type.id}"/>

<g:applyLayout name="form/input">
    <content tag="label"><g:message code="preference.label.value"/></content>
    <content tag="label.for">preference.strValue</content>
    <g:textField class="field" name="preference.value" value="${preference?.value ?: type.defaultValue}"/>
</g:applyLayout>
