<%@ page contentType="text/html;charset=UTF-8" %>

<div class="column-hold">
    <div class="heading">
        <strong>
            ${selected.getDescription(session['language_id'])}
            <em>${selected.id}</em>
        </strong>
    </div>

    <div class="box">
        <fieldset>
            <div class="form-columns">
                <g:applyLayout name="form/text">
                    <content tag="label"><g:message code="contact.type.label.primary"/></content>
                    <g:formatBoolean boolean="${selected?.isPrimary > 0}"/>
                </g:applyLayout>

                <g:each var="language" in="${languages}">
                    <g:applyLayout name="form/text">
                        <content tag="label">${language.description}</content>
                        ${selected?.getDescription(language.id)}
                    </g:applyLayout>
                </g:each>
            </div>
        </fieldset>
    </div>

    <div class="btn-box buttons">
        <div class="row"></div>
    </div>
</div>