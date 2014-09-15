
<div class="row">
    <label>${pageProperty(name: 'page.group.label') ?: '&nbsp;'}</label>
    <g:layoutBody/>
    <label for="<g:pageProperty name="page.label.for"/>" class="lb"><g:pageProperty name="page.label"/></label>
</div>
