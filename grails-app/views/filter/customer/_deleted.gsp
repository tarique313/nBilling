
<div id="${filter.name}">
    <span class="title <g:if test='${filter.value}'>active</g:if>"><g:message
            code="filters.${filter.field}.title"/></span>
    <g:remoteLink class="delete" controller="filter" action="remove" params="[name: filter.name]" update="filters"/>

    <div class="slide">
        <fieldset>
            <div class="input-row">
                <div class="select-filter">
                    <g:select name="filters.${filter.name}.integerValue"
                              from="${[[value:1,label:message(code:'prompt.yes')],[value:0,label:message(code:'prompt.no')]]}"
                              optionKey="value"
                              optionValue="label"
                              value="${filter.integerValue}"/>
                </div>
                <label for="filters.${filter.name}.integerValue"><g:message code="filters.deleted.label"/></label>
            </div>
        </fieldset>
    </div>
</div>
