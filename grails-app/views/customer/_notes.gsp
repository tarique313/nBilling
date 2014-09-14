<div class="heading">
    <strong><g:message code="customer.detail.edit.note.title"/></strong>
</div>

<g:form id="notes-form" name="notes-form" url="[action: 'saveNotes']">
    <g:hiddenField name="id" value="${selected.id}"/>

    <div class="box">
        <div class="box-text">
            <label class="lb"><g:message code="customer.detail.note.title"/></label>
            <g:textArea name="notes" value="${selected.customer.notes}" rows="5" cols="60"/>
        </div>
    </div>

    <div class="btn-box buttons">
        <ul>
            <li><a class="submit save" onclick="$('#notes-form').submit();"><span><g:message code="button.save"/></span></a></li>
            <li><a class="submit cancel" onclick="closePanel(this);"><span><g:message code="button.cancel"/></span></a></li>
        </ul>
    </div>
</g:form>