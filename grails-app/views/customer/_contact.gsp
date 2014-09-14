

<%@ page import="com.sapienter.jbilling.server.util.db.CountryDTO" %>
<div id="contact-${contactType.id}" class="contact" style="${contactType.isPrimary == 1 ? '' : 'display: none;'}">

    <g:hiddenField name="contact-${contactType?.id}.id" value="${contact?.id}"/>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.organization.name"/></content>
        <content tag="label.for">contact-${contactType?.id}.organizationName</content>
        <g:textField class="field" name="contact-${contactType?.id}.organizationName" value="${contact?.organizationName}" />
    </g:applyLayout>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.first.name"/></content>
        <content tag="label.for">contact-${contactType?.id}.firstName</content>
        <g:textField class="field" name="contact-${contactType?.id}.firstName" value="${contact?.firstName}" />
    </g:applyLayout>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.last.name"/></content>
        <content tag="label.for">contact-${contactType?.id}.lastName</content>
        <g:textField class="field" name="contact-${contactType?.id}.lastName" value="${contact?.lastName}" />
    </g:applyLayout>

    <g:applyLayout name="form/text">
        <content tag="label"><g:message code="prompt.phone.number"/></content>
        <content tag="label.for">contact-${contactType?.id}.phoneCountryCode</content>
        <span>
            <g:textField class="field" id="phone_1" name="contact-${contactType?.id}.phoneCountryCode" value="${contact?.phoneCountryCode}" maxlength="3" size="2"/>
            -
            <g:textField class="field" id="phone_2" name="contact-${contactType?.id}.phoneAreaCode" value="${contact?.phoneAreaCode}" maxlength="5" size="3"/>
            -
            <g:textField class="field" id="phone_3" name="contact-${contactType?.id}.phoneNumber" value="${contact?.phoneNumber}" maxlength="10" size="8"/>
        </span>
    </g:applyLayout>
    
     <g:applyLayout name="form/text">
        <content tag="label"><g:message code="prompt.social.number"/></content>
        <content tag="label.for"></content>
        <span>
            <g:textField class="field" name="ssn" value="" maxlength="3" size="2"/>
            -
            <g:textField class="field" name="ssn" value="" maxlength="5" size="3"/>
            -
            <g:textField class="field" name="ssn" value="" maxlength="10" size="8"/>
        </span>
    </g:applyLayout>
    

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.email"/></content>
        <content tag="label.for">contact-${contactType?.id}.email</content>
        <g:textField class="field" id = "email_field" name="contact-${contactType?.id}.email" value="${contact?.email}" />
    </g:applyLayout>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.address1"/></content>
        <content tag="label.for">contact-${contactType?.id}.address1</content>
        <g:textField class="field" id = "address_1" name="contact-${contactType?.id}.address1" value="${contact?.address1}" />
    </g:applyLayout>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.address2"/></content>
        <content tag="label.for">contact-${contactType?.id}.address2</content>
        <g:textField class="field" id = "address_2" name="contact-${contactType?.id}.address2" value="${contact?.address2}" />
    </g:applyLayout>

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.city"/></content>
        <content tag="label.for">contact-${contactType?.id}.city</content>
        <g:textField class="field" id = "city" name="contact-${contactType?.id}.city" value="${contact?.city}" />
    </g:applyLayout><%--

    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.state"/></content>
        <content tag="label.for">contact-${contactType?.id}.stateProvince</content>
        <g:textField class="field" id = "state" name="contact-${contactType?.id}.stateProvince" value="${contact?.stateProvince}" />
    </g:applyLayout>
		--%><g:applyLayout name="form/select">
						        <content tag="label"><g:message code="prompt.state"/></content>
						        <content tag="label.for">contact-${contactType?.id}.stateProvince</content>
								<g:select id="state" class="field" name="contact-${contactType?.id}.stateProvince" value="${contact?.stateProvince}"
						                  from="${[
											  'Alabama':'Alabama',
											  'Alaska':'Alaska',
											  'Delaware':'Delaware',
											  'District of Columbia':'District of Columbia',
											  'Florida':'Florida',
											  'Arizona':'Arizona',
											  'Arkansas':'Arkansas',
											  'California':'California',
											  'Colorado':'Colorado',
											  'Connecticut':'Connecticut',
											  'Georgia':'Georgia',
											  'Guam':'Guam',
											  'Hawaii':'Hawaii',
											  'Idaho':'Idaho',
											  'Illinois':'Illinois',
											  'Indiana':'Indiana',
											  'Iowa':'Iowa',
											  'Kansas':'Kansas',
											  'Kentucky':'Kentucky',
											  'Louisiana':'Louisiana',
											  'Maine':'Maine',
											  'Maryland':'Maryland',
											  'Massachusetts':'Massachusetts',
											  'Michigan':'Michigan',
											  'Minnesota':'Minnesota',
											  'Mississippi':'Mississippi',
											  'Missouri':'Missouri',
											  'Montana':'Montana',
											  'Nebraska':'Nebraska',
											  'Nevada':'Nevada',
											  'New Hampshire':'  New Hampshire',
											  'New Jersey':'New Jersey',
											  'New Mexico':'New Mexico',
											  'New York':'New York',
											  'North Carolina':'North Carolina',
											  'North Dakota':'North Dakota',
											  'Ohio':'Ohio',
											  'Oklahoma':'Oklahoma',
											  'Oregon':'Oregon',
											  'Pennsylvania':'Pennsylvania',
											  'Puerto Rico':'Puerto Rico',
											  'Rhode Island':'Rhode Island',
											  'South Carolina':'South Carolina',
											  'South Dakota':'South Dakota',
											  'Tennessee':'Tennessee',
											  'Texas':'Texas',
											  'Utah':'Utah',
											  'Vermont':'Vermont',
											  'Virginia':'Virginia',
											  'Washington':'Washington',
											  'West Virginia':'West Virginia',
											  'Wisconsin':'Wisconsin',
											  'Wyoming':'Wyoming']}"
						                  optionKey="key"
										  optionValue="value"
						                  noSelection="['': message(code: 'default.no.selection')]"
						                   />
    						</g:applyLayout>
		
		
    <g:applyLayout name="form/input">
        <content tag="label"><g:message code="prompt.zip"/></content>
        <content tag="label.for">contact-${contactType?.id}.postalCode</content>
        <g:textField class="field" id = "zip" name="contact-${contactType?.id}.postalCode" value="${contact?.postalCode}" />
    </g:applyLayout>

    <g:applyLayout name="form/select">
        <content tag="label"><g:message code="prompt.country"/></content>
        <content tag="label.for">contact-${contactType?.id}.countryCode</content>

        <g:select name="contact-${contactType?.id}.countryCode"
                  from="${CountryDTO.list()}"
                  optionKey="code"
                  optionValue="${{ it.getDescription(session['language_id']) }}"
                  noSelection="['': message(code: 'default.no.selection')]"
                  value="${contact?.countryCode}"/>
    </g:applyLayout>
	
	<g:applyLayout name="form/select">
        <content tag="label"><g:message code="prompt.service"/></content>
        <content tag="label.for">contact-${contactType?.id}.status</content>
		<g:select name="contact-${contactType?.id}.status"
        		  value="${contact?.status}"
                  from="${[1: 'Yes', 0: 'No']}"
                  optionKey="key"
				  optionValue="value"
                  noSelection="['': message(code: 'default.no.selection')]"
                   />
    </g:applyLayout>
	
    <g:applyLayout name="form/checkbox">
        <content tag="label"><g:message code="prompt.include.in.notifications"/></content>
        <content tag="label.for">contact-${contactType?.id}.include</content>
        <g:checkBox class="cb checkbox" name="contact-${contactType?.id}.include" checked="${contact?.include}"/>
    </g:applyLayout>
</div>
