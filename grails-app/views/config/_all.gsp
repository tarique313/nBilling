
<%@ page import="com.sapienter.jbilling.server.util.Constants; org.apache.commons.lang.StringUtils; org.apache.commons.lang.WordUtils" contentType="text/html;charset=UTF-8" %>

<div class="table-box">
    <table id="users" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th><g:message code="preference.th.type"/></th>
                <th class="medium2"><g:message code="preference.th.value"/></th>
            </tr>
        </thead>

        <tbody>
            <g:each var="type" in="${preferenceTypes}">
                <tr id="type-${type.id}" class="${selected?.id == type.id ? 'active' : ''}">
                    <td>
                        <g:remoteLink class="cell double" action="show" id="${type.id}" before="register(this);" onSuccess="render(data, next);">
                            <strong>${StringUtils.abbreviate(type.getDescription(session['language_id']), 50)}</strong>
                            <em>Id: ${type.id}</em>
                        </g:remoteLink>
                    </td>

                    <td class="medium2">
                        <g:remoteLink class="cell" action="show" id="${type.id}" before="register(this);" onSuccess="render(data, next);">

                            <g:if test="${type.preferences}">
                                %{
                                    def preference = type.preferences.find{
                                                        it.jbillingTable.name == Constants.TABLE_ENTITY && it.foreignId == session['company_id']
                                                    } ?: type.preferences.asList().first()
                                }%

                                ${preference.value}
                            </g:if>
                            <g:else>
                                ${type.defaultValue}
                            </g:else>

                        </g:remoteLink>
                    </td>
                </tr>
            </g:each>

        </tbody>
    </table>
</div>