<div id="${filter.name}">
    <span class="title <g:if test='${filter.value}'>active</g:if>"><g:message code="filters.${filter.field}.title"/></span>
    <g:remoteLink class="delete" controller="filter" action="remove" params="[name: filter.name]" update="filters"/>

    <div class="slide">
        <fieldset>
            <div class="input-row">
                <div class="input-bg">
                    <g:textField name="filters.${filter.name}.integerValue" value="${filter.integerValue}" class="{validate:{ digits: true }}"/>
                </div>
                <label for="filters.${filter.name}.integerValue"><g:message code="filters.${filter.field}.label"/></label>
            </div>
        </fieldset>
    </div>
</div>
