

<div class="row">
    <label for="<g:pageProperty name="page.label.for"/>">
        ${pageProperty(name: 'page.label') ?: '&nbsp;'}
    </label>
    <div class="inp-bg inp4">
        <g:pageProperty name="page.name"/>
    </div>
    <div class="inp-bg inp4">
        <g:pageProperty name="page.value"/>
    </div>
    <g:layoutBody/>
</div>