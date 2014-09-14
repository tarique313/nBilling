package jbilling

import grails.plugins.springsecurity.Secured

@Secured(["isAuthenticated()"])
class RecentItemController {

    def recentItemService

    def index = {
        render template: "/layouts/includes/recent"
    }

}
