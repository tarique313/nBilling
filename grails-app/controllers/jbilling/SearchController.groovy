package jbilling

enum SearchType {
    CUSTOMERS, ORDERS, INVOICES, PAYMENTS, BILLINGPROCESS, MEDIATIONPROCESS
}

class SearchCommand {
    Integer id
    String type
}


class SearchController {

    def filterService
    def recentItemService
    def breadcrumbService

    def index = { SearchCommand cmd ->

        // add a filter to limit the list by the ID searched
        def filter = new Filter(type: FilterType.ALL, constraintType: FilterConstraint.EQ, field: 'id', template: 'id', visible: true, integerValue: cmd.id)

        // redirect to the controller of the type being searched
        def type = Enum.valueOf(SearchType.class, cmd.type)
		
		System.out.println ("------------------->>>>>>>>>"+type);
		
        switch (type) {
            case SearchType.CUSTOMERS:
                filterService.setFilter(FilterType.CUSTOMER, filter)
                redirect(controller: 'customer', action: 'list', id: cmd.id)
                break

            case SearchType.ORDERS:
                filterService.setFilter(FilterType.ORDER, filter)
                redirect(controller: 'order', action: 'list', id: cmd.id)
                break

            case SearchType.INVOICES:
                filterService.setFilter(FilterType.INVOICE, filter)
                redirect(controller: 'invoice', action: 'list', id: cmd.id)
                break

            case SearchType.PAYMENTS:
                filterService.setFilter(FilterType.PAYMENT, filter)
                redirect(controller: 'payment', action: 'list', id: cmd.id)
                break
				
			case SearchType.BILLINGPROCESS:
				filterService.setFilter(FilterType.BILLINGPROCESS, filter)
				redirect(controller: 'billing', action: 'index', id: cmd.id)
				break
				
			case SearchType.MEDIATIONPROCESS:
				filterService.setFilter(FilterType.MEDIATIONPROCESS, filter)
				redirect(controller: 'mediation', action: 'index', id: cmd.id)
				break
        }
    }
}
