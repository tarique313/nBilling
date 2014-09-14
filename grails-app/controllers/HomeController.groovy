import grails.plugins.springsecurity.Secured
import jbilling.Breadcrumb

class HomeController {

    def recentItemService
    def breadcrumbService

    @Secured(["isAuthenticated()"])
    def index = {        
        def breadcrumb = Breadcrumb.findByUserId(session['user_id'], [sort:'id', order:'desc'])

        if (breadcrumb) {
            // show last page viewed
            redirect(controller: breadcrumb.controller, action: breadcrumb.action, id: breadcrumb.objectId)
        } else {
            // show default page
            redirect(controller: 'customer')
        }
    }
}
