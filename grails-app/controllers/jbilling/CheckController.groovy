
package jbilling


import groovy.sql.Sql

enum  CheckType {
 CUSTOMER
}

class CheckCommand {
    Integer id
	
    String street
	String apt
	String city
	String state
	String zip
	String type
}


class CheckController {

	def dataSource	
    def filterService
    def recentItemService
    def breadcrumbService

    def index = { CheckCommand  cmd ->

        // add a filter to limit the list by the ID searched
       // def filter = new Filter(city: FilterType.ALL, constraintType: FilterConstraint.EQ, field: 'id', template: 'id', visible: true, integerValue: cmd.id)
		
		//def type = Enum.valueOf(CheckType.class, cmd.city)
		//def mydata = filterService.setFilter(FilterType.CUSTOMER, filter)
		
			
        
		
		// redirect to the controller of the type being searched
        /*def type = Enum.valueOf(CheckType.class, cmd.city)
        switch (type) {
            case CheckType.CUSTOMERS:
                filterService.setFilter(FilterType.CUSTOMER, filter)
                redirect(controller: 'customer', action: 'list', id: cmd.id)
                break
				}*/
           /* case CheckType.ORDERS:
                filterService.setFilter(FilterType.ORDER, filter)
                redirect(controller: 'order', action: 'list', id: cmd.id)
                break

            case CheckType.INVOICES:
                filterService.setFilter(FilterType.INVOICE, filter)
                redirect(controller: 'invoice', action: 'list', id: cmd.id)
                break

            case CheckType.PAYMENTS:
                filterService.setFilter(FilterType.PAYMENT, filter)
                redirect(controller: 'payment', action: 'list', id: cmd.id)
                break
				
			case CheckType.BILLINGPROCESS:
				filterService.setFilter(FilterType.BILLINGPROCESS, filter)
				redirect(controller: 'billing', action: 'index', id: cmd.id)
				break
				
			case CheckType.MEDIATIONPROCESS:
				filterService.setFilter(FilterType.MEDIATIONPROCESS, filter)
				redirect(controller: 'mediation', action: 'index', id: cmd.id)
				break
        }*/
		
			
		def sql  = new Sql(dataSource)
		def contacts = sql.rows("select * from contact where street_addres1= ? AND city= ?", [cmd.street, cmd.city])
		sql.close() 
		
		
		
		if(!contacts.empty)
		{
			
			render view: "test_check", model:[ address_2: cmd.street, address_1: cmd.apt, citydata: cmd.city, state_addr: cmd.state, zip_code: cmd.zip]
			return 
		}	
		else
		{
			render view: "test_check_fail", model:[address_2: cmd.street, address_1: cmd.apt, citydata: cmd.city, state_addr: cmd.state, zip_code: cmd.zip]
			return
		}
    }
	
	
	
	
	
}


