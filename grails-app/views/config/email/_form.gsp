<%@ page import="com.sapienter.jbilling.server.util.Constants" %>

<div class="form-edit">
    <div class="heading">
        <strong><g:message code="email.config.title"/></strong>
    </div>
    <div class="form-hold">
        <g:uploadForm name="save-email-form" url="[action: 'saveEmail']">
            <fieldset>
                <div class="form-columns">
                    <div class="column single">

                        <g:applyLayout name="form/checkbox">
                            <content tag="label"><g:message code="email.config.label.self.deliver"/></content>
                            <content tag="label.for">selfDeliver</content>
                            <g:checkBox class="cb" name="selfDeliver" checked="${selfDeliver.value == '1'}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/checkbox">
                            <content tag="label"><g:message code="email.config.label.customer.notes"/></content>
                            <content tag="label.for">customerNotes</content>
                            <g:checkBox class="cb" name="customerNotes" checked="${customerNotes.value == '1'}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/input">
                            <content tag="label"><g:message code="email.config.label.days.for.notification.1"/></content>
                            <content tag="label.for">daysForNotification1</content>
                            <g:textField name="daysForNotification1" class="field" value="${daysForNotification1.value}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/input">
                            <content tag="label"><g:message code="email.config.label.days.for.notification.2"/></content>
                            <content tag="label.for">daysForNotification2</content>
                            <g:textField name="daysForNotification2" class="field" value="${daysForNotification2.value}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/input">
                            <content tag="label"><g:message code="email.config.label.days.for.notification.2"/></content>
                            <content tag="label.for">daysForNotification3</content>
                            <g:textField name="daysForNotification3" class="field" value="${daysForNotification3.value}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/checkbox">
                            <content tag="label"><g:message code="email.config.label.use.invoice.reminder"/></content>
                            <content tag="label.for">useInvoiceReminders</content>
                            <g:checkBox class="cb" name="useInvoiceReminders" checked="${useInvoiceReminders.value == '1'}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/input">
                            <content tag="label"><g:message code="email.config.label.first.invoice.reminder"/></content>
                            <content tag="label.for">firstReminder</content>
                            <g:textField name="firstReminder" class="field" value="${firstReminder.value}"/>
                        </g:applyLayout>

                        <g:applyLayout name="form/input">
                            <content tag="label"><g:message code="email.config.label.next.invoice.reminder"/></content>
                            <content tag="label.for">nextReminder</content>
                            <g:textField name="nextReminder" class="field" value="${nextReminder.value}"/>
                        </g:applyLayout>

                        <!-- spacer -->
                        <div>
                            <br/>&nbsp;
                        </div>
                   </div>
                </div>
            </fieldset>
        </g:uploadForm>
    </div>

    <div class="btn-box">
        <a onclick="$('#save-email-form').submit();" class="submit save"><span><g:message code="button.save"/></span></a>
        <g:link controller="config" action="index" class="submit cancel"><span><g:message code="button.cancel"/></span></g:link>
    </div>
</div>