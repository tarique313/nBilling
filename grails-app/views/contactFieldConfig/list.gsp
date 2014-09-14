<html>
<head>
    <meta name="layout" content="configuration" />
</head>
<body>
    <!-- selected configuration menu item -->
    <content tag="menu.item">customContactField</content>

    <content tag="column1">
    <g:render template="customContactField" />
    </content>

    <content tag="column2">
        <g:if test="${selected}">
            <!-- show selected contact type -->
            <g:render template="show" model="['selected': selected]"/>
        </g:if>
    </content>
</body>
</html>