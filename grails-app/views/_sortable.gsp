

<g:remoteLink controller="${controller}" action="${action}" id="${id}"
        params="${sortableParams(params: [partial: true, max: params.max, offset: params.offset], sort: sort, order: order, alias: alias)}"
        update="${update}">
    ${body}
    <img src="${resource(dir: 'images', file: order ? 'arrows-' + order + '.gif' : 'arrows.gif')}" alt="sort"/>
</g:remoteLink>