

<%--
  Layout for labeled and styled select (drop-down box) elements.

  Usage:

    <g:applyLayout name="form/select">
        <content tag="label">Field Label</content>
        <content tag="label.for">element_id</content>
        <select name="name" id="element_id">
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
        </select>
    </g:applyLayout>
--%>

<div class="row">
    <label for="<g:pageProperty name="page.label.for"/>"><g:pageProperty name="page.label"/></label>
    <g:layoutBody/>
</div>