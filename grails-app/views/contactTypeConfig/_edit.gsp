<%@ page contentType="text/html;charset=UTF-8" %>

<div class="column-hold">
    <div class="heading">
        <strong><g:message code="contact.type.label.new.contact"/></strong>
    </div>

    <g:form id="save-type-form" name="notes-form" url="[action: 'save']">

    <div class="box">
        <fieldset>
            <div class="form-columns">
                <g:hiddenField name="id" value="${contactType?.id}"/>

                <g:applyLayout name="form/text">
                    <content tag="label"><g:message code="contact.type.label.primary"/></content>
                    <g:formatBoolean boolean="${contactType?.isPrimary > 0}"/>
                    <g:hiddenField name="isPrimary" value="${contactType?.isPrimary ?: 0}"/>
                </g:applyLayout>

                <g:each var="language" in="${languages}">
                    <g:applyLayout name="form/input">
                        <content tag="label">${language.description}</content>
                        <content tag="label.for">language.${language.id}</content>
                        <g:textField class="field" name="language.${language.id}" value="${contactType?.getDescription(language.id)}"/>
                    </g:applyLayout>
                </g:each>
            </div>
        </fieldset>
    </div>

    </g:form>

    <div class="btn-box buttons">
        <ul>
            <li><a class="submit save" onclick="$('#save-type-form').submit();"><span><g:message code="button.save"/></span></a></li>
            <li><a class="submit cancel" onclick="closePanel(this);"><span><g:message code="button.cancel"/></span></a></li>
        </ul>
    </div>
</div>