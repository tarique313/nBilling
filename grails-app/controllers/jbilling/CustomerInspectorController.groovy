package jbilling

import com.sapienter.jbilling.server.invoice.db.InvoiceDTO
import com.sapienter.jbilling.server.item.CurrencyBL
import com.sapienter.jbilling.server.order.db.OrderDAS
import com.sapienter.jbilling.server.payment.db.PaymentDTO
import com.sapienter.jbilling.server.user.ContactWS
import com.sapienter.jbilling.server.user.contact.db.ContactTypeDAS
import com.sapienter.jbilling.server.user.db.CompanyDTO
import com.sapienter.jbilling.server.user.db.UserDTO
import com.sapienter.jbilling.server.payment.blacklist.BlacklistBL
import grails.plugins.springsecurity.Secured

@Secured(["CUSTOMER_13"])
class CustomerInspectorController {
	
	def webServicesSession
    def viewUtils

    def breadcrumbService
    def productService

	def index = { 
		redirect action: 'inspect', params: params
	}

	def inspect = {
		def user = params.id ? UserDTO.get(params.int('id')) : null

        if (!user) {
            flash.error = 'no.user.found'
            flash.args = [ params.id as String ]
            return // todo: show generic error page
        }

        def revenue =  webServicesSession.getTotalRevenueByUser(user.id)
        def subscriptions = webServicesSession.getUserSubscriptions(user.id)

        // last invoice
        def invoiceIds = webServicesSession.getLastInvoices(user.id, 1)
        def invoice = invoiceIds ? InvoiceDTO.get(invoiceIds.first()) : null

        // last payment
        def paymentIds = webServicesSession.getLastPayments(user.id, 1)
        def payment = paymentIds ? PaymentDTO.get(paymentIds.first()) : null

        // extra contacts and contact type descriptions
        def contacts = user ? webServicesSession.getUserContactsWS(user.id) : null
        for (ContactWS contact : contacts) {
            def contactType = new ContactTypeDAS().find(contact.type)
            contact.setContactTypeDescr(contactType?.getDescription(session['language_id'].toInteger()))
        }

        // blacklist matches
        def blacklistMatches = BlacklistBL.getBlacklistMatches(user.id)

        // used to find the next invoice date
        def cycle = new OrderDAS().findEarliestActiveOrder(user.id)

        // all customer prices and products
        def company = CompanyDTO.get(session['company_id'])
        def itemTypes = company.itemTypes.sort{ it.id }
        params.typeId = !itemTypes.isEmpty() ? itemTypes?.asList()?.first()?.id : null


        breadcrumbService.addBreadcrumb(controllerName, actionName, null, params.int('id'))

        [
                user: user,
                contacts: contacts,
                blacklistMatches: blacklistMatches,
                invoice: invoice,
                payment: payment,
                subscriptions: subscriptions,
                company: company,
                itemTypes: itemTypes,
                currencies: currencies,
                cycle: cycle,
                revenue: revenue
        ]
    }

    def getCurrencies() {
        def currencies = new CurrencyBL().getCurrencies(session['language_id'].toInteger(), session['company_id'].toInteger())
        return currencies.findAll { it.inUse }
    }

}
