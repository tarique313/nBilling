<div id="${filter.name}">
    <span class="title <g:if test='${filter.value}'>active</g:if>"><g:message code="filters.description.title"/></span>
    <g:remoteLink class="delete" controller="filter" action="remove" params="[name: filter.name]" update="filters"/>

    <div class="slide">
        <fieldset>
            <div class="input-row">
                <div class="input-bg" style="float:left;">
                    <g:textField name="filters.${filter.name}.stringValue" value="${filter.stringValue}" class="{validate:{ maxlength: 50 }}"/>
                </div>
            </div>
        </fieldset>
    </div>
</div>