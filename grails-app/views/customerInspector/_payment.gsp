
<table class="dataTable" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <td><g:message code="payment.date"/></td>
        <td class="value"><g:formatDate date="${payment?.paymentDate ?: payment?.createDatetime}" formatName="date.pretty.format"/></td>

        <td><g:message code="payment.id"/></td>
        <td class="value"><g:link controller="payment" action="list" id="${payment?.id}">${payment?.id}</g:link></td>
    </tr>
    <tr>
        <td><g:message code="payment.amount"/></td>
        <td class="value"><g:formatNumber number="${payment?.amount}" type="currency" currencySymbol="${payment?.currency?.symbol}"/> &nbsp;</td>

        <td><g:message code="payment.balance"/></td>
        <td class="value"><g:formatNumber number="${payment?.balance}" type="currency" currencySymbol="${payment?.currency?.symbol}"/> &nbsp;</td>
    </tr>
    <tr>
        <td><g:message code="payment.result"/></td>
        <td class="value">${payment?.paymentResult.getDescription(session['language_id'])}</td>

        <td><g:message code="payment.attempt"/></td>
        <td class="value">${payment?.attempt ?: 0}</td>
    </tr>
    </tbody>
</table>