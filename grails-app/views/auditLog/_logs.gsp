<div class="table-box">
    <div class="table-scroll">
        <table id="logs" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th class="small">
                        <g:remoteSort action="list" sort="createDatetime" update="column1">
                            <g:message code="log.th.date"/>
                        </g:remoteSort>
                    </th>
                    <th class="small"><g:message code="log.th.table"/></th>
                    <th class="small">
                        <g:remoteSort action="list" sort="foreignId" update="column1">
                            <g:message code="log.th.foreign_id"/>
                        </g:remoteSort>
                    </th>
                    <th class="medium"><g:message code="log.th.message"/></th>
                    <th class="small"><g:message code="log.th.user"/></th>
                </tr>
            </thead>

            <tbody>
            <g:each var="log" in="${logs}">
                <tr id="log-${log.id}" class="${selected?.id == log.id ? 'active' : ''}">

                    <td class="small">
                        <g:remoteLink class="cell" action="show" id="${log.id}" before="register(this);" onSuccess="render(data, next);">
                            <span><g:formatDate date="${log.createDatetime}" formatName="date.timeSecs.format"/></span>
                        </g:remoteLink>
                    </td>
                    <td class="small">
                        <g:remoteLink class="cell" action="show" id="${log.id}" before="register(this);" onSuccess="render(data, next);">
                            <span>${log.jbillingTable.name}</span>
                        </g:remoteLink>
                    </td>
                    <td class="small">
                        <g:remoteLink class="cell" action="show" id="${log.id}" before="register(this);" onSuccess="render(data, next);">
                            <span>${log.foreignId}</span>
                        </g:remoteLink>
                    </td>
                    <td class="medium">
                        <g:remoteLink class="cell" action="show" id="${log.id}" before="register(this);" onSuccess="render(data, next);">
                            <span>${log.eventLogMessage.getDescription(session['language_id'])}</span>
                        </g:remoteLink>
                    </td>
                    <td class="small">
                        <g:remoteLink class="cell" action="show" id="${log.id}" before="register(this);" onSuccess="render(data, next);">
                            <span>${log.affectedUser?.id}</span>
                        </g:remoteLink>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>


<div class="pager-box">
    <div class="row left">
        <g:render template="/layouts/includes/pagerShowResults" model="[steps: [10, 20, 50], update: 'column1']"/>
    </div>
    <div class="row">
        <%-- 
            <util:remotePaginate controller="auditLog" action="list" params="[applyFilter: true]" total="${logs.totalCount}" update="column1"/>
        --%>
        <util:remotePaginate controller="auditLog" action="list" params="${sortableParams(params: [partial: true])}" total="${logs?.totalCount ?: 0}" update="column1"/>
    </div>
</div>


<div class="btn-box">
</div>