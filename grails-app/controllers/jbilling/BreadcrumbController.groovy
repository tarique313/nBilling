package jbilling

import grails.plugins.springsecurity.Secured

@Secured(["isAuthenticated()"])
class BreadcrumbController {

    def breadcrumbService

    def index = {
        render template: "/layouts/includes/breadcrumbs"
    }
}
