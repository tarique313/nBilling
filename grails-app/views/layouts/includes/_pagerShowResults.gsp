<g:message code="pager.show.max.results"/>

<g:each var="max" in="${steps}">
    <g:if test="${params.max == max}">
        <span>${max}</span>
    </g:if>
    <g:else>
        <g:remoteLink action="${action ?: 'list'}" params="${sortableParams(params: [partial: true, max: max,id:id])}" update="${update}">${max}</g:remoteLink>
    </g:else>
</g:each>