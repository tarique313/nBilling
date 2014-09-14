class SortableTagLib {

    static returnObjectForTags = ['sortableParams']

    def remoteSort = { attrs, body ->
        def sort = assertAttribute('sort', attrs, 'remoteSort') as String
        def order = params.sort == sort ? params.order == 'desc' ? 'asc' : 'desc' : null
        def alias = attrs.containsKey('alias') ? attrs.remove('alias') : null

        def action = assertAttribute('action', attrs, 'remoteSort') as String
        def controller = params.controller ?: controllerName
        def id = params.id

        def update = assertAttribute('update', attrs, 'remoteSort') as String

        out << render(template: "/sortable",
                      params: params,
                      model: [
                              sort: sort,
                              order: order,
                              alias: alias,
                              action: action,
                              controller: controller,
                              id: id,
                              update: update,
                              body: body()
                      ]
        )
    }

    def sortableParams = { attrs, body ->
        def urlParameters = assertAttribute('params', attrs, 'sortableParameters') as Map
        def sort = attrs.containsKey('sort') ? attrs.remove('sort') : params.sort
        def order = attrs.containsKey('order') ? attrs.remove('order') : params.order
        def alias = attrs.containsKey('alias') ? attrs.remove('alias') : params.alias

        if (!urlParameters.containsKey('sort')) {
            urlParameters.put('sort', sort)
        }

        if (!urlParameters.containsKey('order')) {
            urlParameters.put('order', order)
        }

        alias?.each { k, v ->
            urlParameters.put("alias.${k}", v)
        }

        return urlParameters
    }

    protected assertAttribute(String name, attrs, String tag) {
        if (!attrs.containsKey(name)) {
            throwTagError "Tag [$tag] is missing required attribute [$name]"
        }
        attrs.remove name
    }
}
