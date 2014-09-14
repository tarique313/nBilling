
<html>
<head>
    <meta name="layout" content="panels" />
</head>

<body>
    <content tag="column1">
        <g:render template="orders" model="[orders: orders"/>
    </content>

    <content tag="column2">
        <g:if test="${order}">
            <g:render template="show" model="[order: order]"/>
        </g:if>
       
    </content>
   
</body>
</html>