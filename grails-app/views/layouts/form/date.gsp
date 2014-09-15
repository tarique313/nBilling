

<g:set var="jquerySelector" value="#${pageProperty(name: 'page.label.for').replaceAll('\\.','\\\\\\\\\\.')}"/>

<div class="row">
    <label for="<g:pageProperty name="page.label.for"/>"><g:pageProperty name="page.label"/></label>
    <div class="inp-bg date">
        <g:layoutBody/>
    </div>

    <script type="text/javascript">
        // wait to initialize the date picker if it's not visible
        setTimeout(
                function() {
                    var options = $.datepicker.regional['${session.locale.language}'];
                    if (options == null) options = $.datepicker.regional[''];

                    options.dateFormat = "${message(code: 'datepicker.jquery.ui.format')}";
                    options.showOn = "both";
                    options.buttonImage = "${resource(dir:'images', file:'icon04.gif')}";
                    options.buttonImageOnly = true;

                    <g:if test="${pageProperty(name: 'page.onClose')}">
                    options.onClose = ${pageProperty(name: 'page.onClose')}
                    </g:if>

                    $("${jquerySelector}").datepicker(options);
                },
                $('${jquerySelector}').is(":visible") ? 0 : 500
        );
    </script>
</div>

