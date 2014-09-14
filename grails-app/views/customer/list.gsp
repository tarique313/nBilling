<%@ page import="com.sapienter.jbilling.server.user.contact.db.ContactDTO" %>
<html>
<head>
    <meta name="layout" content="panels" />
</head>
<body>

%{--show all user's details--}%
<sec:ifAllGranted roles="MENU_90">
    <content tag="column1">
        <g:render template="customers" model="[users: users]"/>
    </content>

    <content tag="column2">
        <g:if test="${selected}">
            <!-- show selected user details -->
            <g:render template="show" model="[selected: selected, contact: contact]"/>
        </g:if>
    <g:else>
            <!-- show empty block -->
        <div class="heading"><strong><em><g:message code="customer.detail.not.selected.title"/></em></strong></div>
        <div class="box"><em><g:message code="customer.detail.not.selected.message"/></em></div>
        <div class="btn-box"></div>
    </g:else>
</content>
</sec:ifAllGranted>

%{--just show details of the current user--}%
<sec:ifNotGranted roles="MENU_90">
    <content tag="column1">
        <g:if test="${selected}">
            <!-- show selected user details only -->
            <g:render template="show" model="[selected: selected, contact: contact]"/>
        </g:if>
        <g:else>
            <!-- show empty block -->
            <div class="heading"><strong><em><g:message code="customer.detail.not.selected.title"/></em></strong></div>
            <div class="box"><em><g:message code="customer.detail.not.selected.message"/></em></div>
            <div class="btn-box"></div>
        </g:else>
    </content>
</sec:ifNotGranted>

</body>
</html>