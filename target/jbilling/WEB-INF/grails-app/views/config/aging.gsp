%{--
  JBILLING CONFIDENTIAL
  _____________________

  [2003] - [2012] Enterprise jBilling Software Ltd.
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Enterprise jBilling Software.
  The intellectual and technical concepts contained
  herein are proprietary to Enterprise jBilling Software
  and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden.
  --}%

<html>
<head>
     <meta name="layout" content="configuration" />
     
     <script type="text/javascript">
        var selected;

        // todo: should be attached to the ajax "success" event.
        // row should only be highlighted when it really is selected.
        $(document).ready(function() {
            $('.table-box li').bind('click', function() {
                if (selected) selected.attr("class", "");
                selected = $(this);
                selected.attr("class", "active");
            })
        });
    </script>
</head>
<body>
    <!-- selected configuration menu item -->
    <content tag="menu.item">aging</content>

    <content tag="column1">
        <g:render template="aging/form" model="[ageingSteps:ageingSteps,gracePeriod:gracePeriod]"/>
    </content>
</body>
</html>