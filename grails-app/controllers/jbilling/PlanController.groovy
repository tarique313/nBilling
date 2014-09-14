package jbilling

import grails.plugins.springsecurity.Secured

@Secured(["MENU_98"])
class PlanController {

    static pagination = [ max: 10, offset: 0 ]

    def webServicesSession
    def viewUtils
    def filterService
    def breadcrumbService

    def index = {
        // show enterprise-only feature page
        //flash.info = 'plan.community.disabled'
    }
}
