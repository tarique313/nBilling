package jbilling

import grails.plugins.springsecurity.Secured

import com.sapienter.jbilling.common.SessionInternalError
import com.sapienter.jbilling.server.mediation.MediationConfigurationWS
import com.sapienter.jbilling.server.pluggableTask.admin.PluggableTaskDTO
import com.sapienter.jbilling.server.pluggableTask.admin.PluggableTaskTypeCategoryDAS
import com.sapienter.jbilling.server.util.Constants


@Secured(["MENU_99"])
class MediationConfigController {

    static pagination = [ max: 10, offset: 0 ]
	
	def webServicesSession
	def viewUtils
	def breadcrumbService

    def index = {
        redirect action: 'list'
    }

    def list = {

        def types= webServicesSession.getAllMediationConfigurations()
        breadcrumbService.addBreadcrumb(controllerName, actionName, null, params.int('id'))
		
		def readers= new ArrayList<PluggableTaskDTO>()
		for(PluggableTaskDTO reader: PluggableTaskDTO.list()) {
			log.debug "Pluggable Task ${reader.id}, Category: ${reader.type.category.id}"
			if (reader?.type?.category?.getId() == Constants.PLUGGABLE_TASK_MEDIATION_READER) {
				readers.add reader
			}
		}

		if (params.template) {
			flash.message=flash.message
			render template: params.template, model:[types: types, readers: readers] 
		} else {
        	render view: 'list', model: [types: types, readers: readers]
		}
    }
	
	def save = {
		def cnt = params.int('recCnt')
		log.debug "Records Count: ${cnt}"
		
		List<MediationConfigurationWS> types= webServicesSession.getAllMediationConfigurations()
		for (MediationConfigurationWS ws: types){
			bindData(ws, params["obj[${ws.id}]"])
			log.debug ws
		}
		webServicesSession.updateAllMediationConfigurations(types)
		
		if (params.orderValue && params.pluggableTaskId && params.name) {
			MediationConfigurationWS ws= new MediationConfigurationWS();
			bindData(ws, params);
			ws.setCreateDatetime new Date()
			ws.setEntityId webServicesSession.getCallerCompanyId()
			webServicesSession.createMediationConfiguration(ws)
		}
		
		flash.message = 'mediation.config.save.success'
		redirect action: 'list'
	}
	
	def delete = {
		webServicesSession.deleteMediationConfiguration(params.int('id'))
		flash.message = 'mediation.config.delete.success'
		redirect action:'list', params:[template: 'config']
	}
	
}
