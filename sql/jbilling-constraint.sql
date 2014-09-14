ALTER TABLE ach
    ADD CONSTRAINT ach_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;

----------------------------------------------------------------------
-- ach
----------------------------------------------------------------------


ALTER TABLE ageing_entity_step
    ADD CONSTRAINT ageing_entity_step_FK_1 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;
ALTER TABLE ageing_entity_step
    ADD CONSTRAINT ageing_entity_step_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- ageing_entity_step
----------------------------------------------------------------------


ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_1 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_2 FOREIGN KEY (subscriber_status)
    REFERENCES generic_status (id)
;
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_3 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_4 FOREIGN KEY (language_id)
    REFERENCES language (id)
;
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_5 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;

----------------------------------------------------------------------
-- base_user
----------------------------------------------------------------------


ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
;
ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_3 FOREIGN KEY (paper_invoice_batch_id)
    REFERENCES paper_invoice_batch (id)
;

----------------------------------------------------------------------
-- billing_process
----------------------------------------------------------------------


ALTER TABLE billing_process_configuration
    ADD CONSTRAINT billing_process_configuration_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
;
ALTER TABLE billing_process_configuration
    ADD CONSTRAINT billing_process_configuration_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- billing_process_configuration
----------------------------------------------------------------------



----------------------------------------------------------------------
-- breadcrumb
----------------------------------------------------------------------


ALTER TABLE process_run
    ADD CONSTRAINT process_run_FK_1 FOREIGN KEY (process_id)
    REFERENCES billing_process (id)
;
ALTER TABLE process_run
    ADD CONSTRAINT process_run_FK_2 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;

----------------------------------------------------------------------
-- process_run
----------------------------------------------------------------------


ALTER TABLE process_run_total
    ADD CONSTRAINT process_run_total_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;
ALTER TABLE process_run_total
    ADD CONSTRAINT process_run_total_FK_2 FOREIGN KEY (process_run_id)
    REFERENCES process_run (id)
;

----------------------------------------------------------------------
-- process_run_total
----------------------------------------------------------------------


ALTER TABLE process_run_total_pm
    ADD CONSTRAINT process_run_total_pm_FK_1 FOREIGN KEY (payment_method_id)
    REFERENCES payment_method (id)
;

----------------------------------------------------------------------
-- process_run_total_pm
----------------------------------------------------------------------


ALTER TABLE process_run_user
    ADD CONSTRAINT process_run_user_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;
ALTER TABLE process_run_user
    ADD CONSTRAINT process_run_user_FK_2 FOREIGN KEY (process_run_id)
    REFERENCES process_run (id)
;

----------------------------------------------------------------------
-- process_run_user
----------------------------------------------------------------------



----------------------------------------------------------------------
-- contact
----------------------------------------------------------------------


ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_1 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
;
ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES contact_type (id)
;
ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_3 FOREIGN KEY (contact_id)
    REFERENCES contact (id)
;

----------------------------------------------------------------------
-- contact_map
----------------------------------------------------------------------


ALTER TABLE contact_type
    ADD CONSTRAINT contact_type_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- contact_type
----------------------------------------------------------------------



----------------------------------------------------------------------
-- country
----------------------------------------------------------------------



----------------------------------------------------------------------
-- credit_card
----------------------------------------------------------------------



----------------------------------------------------------------------
-- currency
----------------------------------------------------------------------


ALTER TABLE currency_entity_map
    ADD CONSTRAINT currency_entity_map_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE currency_entity_map
    ADD CONSTRAINT currency_entity_map_FK_2 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;

----------------------------------------------------------------------
-- currency_entity_map
----------------------------------------------------------------------


ALTER TABLE currency_exchange
    ADD CONSTRAINT currency_exchange_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;

----------------------------------------------------------------------
-- currency_exchange
----------------------------------------------------------------------


ALTER TABLE customer
    ADD CONSTRAINT customer_FK_1 FOREIGN KEY (invoice_delivery_method_id)
    REFERENCES invoice_delivery_method (id)
;
ALTER TABLE customer
    ADD CONSTRAINT customer_FK_2 FOREIGN KEY (partner_id)
    REFERENCES partner (id)
;
ALTER TABLE customer
    ADD CONSTRAINT customer_FK_3 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;

----------------------------------------------------------------------
-- customer
----------------------------------------------------------------------


ALTER TABLE entity
    ADD CONSTRAINT entity_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;
ALTER TABLE entity
    ADD CONSTRAINT entity_FK_2 FOREIGN KEY (language_id)
    REFERENCES language (id)
;

----------------------------------------------------------------------
-- entity
----------------------------------------------------------------------


ALTER TABLE entity_delivery_method_map
    ADD CONSTRAINT entity_delivery_method_map_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE entity_delivery_method_map
    ADD CONSTRAINT entity_delivery_method_map_FK_2 FOREIGN KEY (method_id)
    REFERENCES invoice_delivery_method (id)
;

----------------------------------------------------------------------
-- entity_delivery_method_map
----------------------------------------------------------------------


ALTER TABLE entity_payment_method_map
    ADD CONSTRAINT entity_payment_method_map_FK_1 FOREIGN KEY (payment_method_id)
    REFERENCES payment_method (id)
;
ALTER TABLE entity_payment_method_map
    ADD CONSTRAINT entity_payment_method_map_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- entity_payment_method_map
----------------------------------------------------------------------


ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_1 FOREIGN KEY (module_id)
    REFERENCES event_log_module (id)
;
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_3 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_4 FOREIGN KEY (affected_user_id)
    REFERENCES base_user (id)
;
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_5 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
;
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_6 FOREIGN KEY (message_id)
    REFERENCES event_log_message (id)
;

----------------------------------------------------------------------
-- event_log
----------------------------------------------------------------------



----------------------------------------------------------------------
-- event_log_message
----------------------------------------------------------------------



----------------------------------------------------------------------
-- event_log_module
----------------------------------------------------------------------


ALTER TABLE filter
    ADD CONSTRAINT filter_FK_1 FOREIGN KEY (filter_set_id)
    REFERENCES filter_set (id)
;

----------------------------------------------------------------------
-- filter
----------------------------------------------------------------------



----------------------------------------------------------------------
-- filter_set
----------------------------------------------------------------------


ALTER TABLE international_description
    ADD CONSTRAINT international_description_FK_1 FOREIGN KEY (language_id)
    REFERENCES language (id)
;
ALTER TABLE international_description
    ADD CONSTRAINT international_description_FK_2 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
;

----------------------------------------------------------------------
-- international_description
----------------------------------------------------------------------


ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_1 FOREIGN KEY (billing_process_id)
    REFERENCES billing_process (id)
;
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_2 FOREIGN KEY (paper_invoice_batch_id)
    REFERENCES paper_invoice_batch (id)
;
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_3 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_4 FOREIGN KEY (delegated_invoice_id)
    REFERENCES invoice (id)
;
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_5 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;

----------------------------------------------------------------------
-- invoice
----------------------------------------------------------------------



----------------------------------------------------------------------
-- invoice_delivery_method
----------------------------------------------------------------------


ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_1 FOREIGN KEY (invoice_id)
    REFERENCES invoice (id)
;
ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_2 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_3 FOREIGN KEY (type_id)
    REFERENCES invoice_line_type (id)
;

----------------------------------------------------------------------
-- invoice_line
----------------------------------------------------------------------



----------------------------------------------------------------------
-- invoice_line_type
----------------------------------------------------------------------


ALTER TABLE item
    ADD CONSTRAINT item_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- item
----------------------------------------------------------------------


ALTER TABLE item_price_timeline
    ADD CONSTRAINT item_price_timeline_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE item_price_timeline
    ADD CONSTRAINT item_price_timeline_FK_2 FOREIGN KEY (price_model_id)
    REFERENCES price_model (id)
;

----------------------------------------------------------------------
-- item_price_timeline
----------------------------------------------------------------------


ALTER TABLE item_type
    ADD CONSTRAINT item_type_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- item_type
----------------------------------------------------------------------


ALTER TABLE item_type_map
    ADD CONSTRAINT item_type_map_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE item_type_map
    ADD CONSTRAINT item_type_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES item_type (id)
;

----------------------------------------------------------------------
-- item_type_map
----------------------------------------------------------------------


ALTER TABLE item_type_exclude_map
    ADD CONSTRAINT item_type_exclude_map_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE item_type_exclude_map
    ADD CONSTRAINT item_type_exclude_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES item_type (id)
;

----------------------------------------------------------------------
-- item_type_exclude_map
----------------------------------------------------------------------


ALTER TABLE price_model
    ADD CONSTRAINT price_model_FK_1 FOREIGN KEY (next_model_id)
    REFERENCES price_model (id)
;

----------------------------------------------------------------------
-- price_model
----------------------------------------------------------------------


ALTER TABLE price_model_attribute
    ADD CONSTRAINT price_model_attribute_FK_1 FOREIGN KEY (price_model_id)
    REFERENCES price_model (id)
;

----------------------------------------------------------------------
-- price_model_attribute
----------------------------------------------------------------------


ALTER TABLE plan
    ADD CONSTRAINT plan_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE plan
    ADD CONSTRAINT plan_FK_2 FOREIGN KEY (period_id)
    REFERENCES order_period (id)
;

----------------------------------------------------------------------
-- plan
----------------------------------------------------------------------


ALTER TABLE plan_item
    ADD CONSTRAINT plan_item_FK_1 FOREIGN KEY (plan_id)
    REFERENCES plan (id)
;
ALTER TABLE plan_item
    ADD CONSTRAINT plan_item_FK_2 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE plan_item
    ADD CONSTRAINT plan_item_FK_3 FOREIGN KEY (plan_item_bundle_id)
    REFERENCES plan_item_bundle (id)
;

----------------------------------------------------------------------
-- plan_item
----------------------------------------------------------------------


ALTER TABLE plan_item_price_timeline
    ADD CONSTRAINT plan_item_price_timeline_FK_1 FOREIGN KEY (plan_item_id)
    REFERENCES plan_item (id)
;
ALTER TABLE plan_item_price_timeline
    ADD CONSTRAINT plan_item_price_timeline_FK_2 FOREIGN KEY (price_model_id)
    REFERENCES price_model (id)
;

----------------------------------------------------------------------
-- plan_item_price_timeline
----------------------------------------------------------------------


ALTER TABLE plan_item_bundle
    ADD CONSTRAINT plan_item_bundle_FK_1 FOREIGN KEY (period_id)
    REFERENCES order_period (id)
;

----------------------------------------------------------------------
-- plan_item_bundle
----------------------------------------------------------------------


ALTER TABLE customer_price
    ADD CONSTRAINT customer_price_FK_1 FOREIGN KEY (plan_item_id)
    REFERENCES plan_item (id)
;
ALTER TABLE customer_price
    ADD CONSTRAINT customer_price_FK_2 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;

----------------------------------------------------------------------
-- customer_price
----------------------------------------------------------------------


ALTER TABLE rate_card
    ADD CONSTRAINT rate_card_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- rate_card
----------------------------------------------------------------------



----------------------------------------------------------------------
-- jbilling_table
----------------------------------------------------------------------



----------------------------------------------------------------------
-- jbilling_seqs
----------------------------------------------------------------------



----------------------------------------------------------------------
-- language
----------------------------------------------------------------------


ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_1 FOREIGN KEY (language_id)
    REFERENCES language (id)
;
ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_2 FOREIGN KEY (type_id)
    REFERENCES notification_message_type (id)
;
ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_3 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- notification_message
----------------------------------------------------------------------



----------------------------------------------------------------------
-- notification_message_arch
----------------------------------------------------------------------


ALTER TABLE notification_message_arch_line
    ADD CONSTRAINT notif_mess_arch_line_FK_1 FOREIGN KEY (message_archive_id)
    REFERENCES notification_message_arch (id)
;

----------------------------------------------------------------------
-- notification_message_arch_line
----------------------------------------------------------------------


ALTER TABLE notification_message_line
    ADD CONSTRAINT notification_message_line_FK_1 FOREIGN KEY (message_section_id)
    REFERENCES notification_message_section (id)
;

----------------------------------------------------------------------
-- notification_message_line
----------------------------------------------------------------------


ALTER TABLE notification_message_section
    ADD CONSTRAINT notification_message_section_FK_1 FOREIGN KEY (message_id)
    REFERENCES notification_message (id)
;

----------------------------------------------------------------------
-- notification_message_section
----------------------------------------------------------------------


ALTER TABLE notification_message_type
    ADD CONSTRAINT notification_message_type_FK_1 FOREIGN KEY (category_id)
    REFERENCES notification_category (id)
;

----------------------------------------------------------------------
-- notification_message_type
----------------------------------------------------------------------



----------------------------------------------------------------------
-- notification_category
----------------------------------------------------------------------



----------------------------------------------------------------------
-- order_billing_type
----------------------------------------------------------------------


ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_2 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
;
ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_3 FOREIGN KEY (type_id)
    REFERENCES order_line_type (id)
;

----------------------------------------------------------------------
-- order_line
----------------------------------------------------------------------



----------------------------------------------------------------------
-- order_line_type
----------------------------------------------------------------------


ALTER TABLE order_period
    ADD CONSTRAINT order_period_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE order_period
    ADD CONSTRAINT order_period_FK_2 FOREIGN KEY (unit_id)
    REFERENCES period_unit (id)
;

----------------------------------------------------------------------
-- order_period
----------------------------------------------------------------------


ALTER TABLE order_process
    ADD CONSTRAINT order_process_FK_1 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
;

----------------------------------------------------------------------
-- order_process
----------------------------------------------------------------------



----------------------------------------------------------------------
-- paper_invoice_batch
----------------------------------------------------------------------


ALTER TABLE partner
    ADD CONSTRAINT partner_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
;
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_2 FOREIGN KEY (fee_currency_id)
    REFERENCES currency (id)
;
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_3 FOREIGN KEY (related_clerk)
    REFERENCES base_user (id)
;
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_4 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;

----------------------------------------------------------------------
-- partner
----------------------------------------------------------------------


ALTER TABLE partner_payout
    ADD CONSTRAINT partner_payout_FK_1 FOREIGN KEY (partner_id)
    REFERENCES partner (id)
;

----------------------------------------------------------------------
-- partner_payout
----------------------------------------------------------------------



----------------------------------------------------------------------
-- partner_range
----------------------------------------------------------------------


ALTER TABLE payment
    ADD CONSTRAINT payment_FK_1 FOREIGN KEY (ach_id)
    REFERENCES ach (id)
;
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_2 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_3 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
;
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_4 FOREIGN KEY (credit_card_id)
    REFERENCES credit_card (id)
;
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_5 FOREIGN KEY (result_id)
    REFERENCES payment_result (id)
;
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_6 FOREIGN KEY (method_id)
    REFERENCES payment_method (id)
;

----------------------------------------------------------------------
-- payment
----------------------------------------------------------------------


ALTER TABLE payment_authorization
    ADD CONSTRAINT payment_authorization_FK_1 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
;

----------------------------------------------------------------------
-- payment_authorization
----------------------------------------------------------------------


ALTER TABLE payment_info_cheque
    ADD CONSTRAINT payment_info_cheque_FK_1 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
;

----------------------------------------------------------------------
-- payment_info_cheque
----------------------------------------------------------------------


ALTER TABLE payment_invoice
    ADD CONSTRAINT payment_invoice_FK_1 FOREIGN KEY (invoice_id)
    REFERENCES invoice (id)
;
ALTER TABLE payment_invoice
    ADD CONSTRAINT payment_invoice_FK_2 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
;

----------------------------------------------------------------------
-- payment_invoice
----------------------------------------------------------------------



----------------------------------------------------------------------
-- payment_method
----------------------------------------------------------------------



----------------------------------------------------------------------
-- payment_result
----------------------------------------------------------------------



----------------------------------------------------------------------
-- period_unit
----------------------------------------------------------------------


ALTER TABLE enumeration
    ADD CONSTRAINT enumeration_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- enumeration
----------------------------------------------------------------------


ALTER TABLE enumeration_values
    ADD CONSTRAINT enumeration_values_FK_1 FOREIGN KEY (enumeration_id)
    REFERENCES enumeration (id)
;

----------------------------------------------------------------------
-- enumeration_values
----------------------------------------------------------------------


ALTER TABLE permission
    ADD CONSTRAINT permission_FK_1 FOREIGN KEY (type_id)
    REFERENCES permission_type (id)
;

----------------------------------------------------------------------
-- permission
----------------------------------------------------------------------


ALTER TABLE permission_role_map
    ADD CONSTRAINT permission_role_map_FK_1 FOREIGN KEY (role_id)
    REFERENCES role (id)
;
ALTER TABLE permission_role_map
    ADD CONSTRAINT permission_role_map_FK_2 FOREIGN KEY (permission_id)
    REFERENCES permission (id)
;

----------------------------------------------------------------------
-- permission_role_map
----------------------------------------------------------------------



----------------------------------------------------------------------
-- permission_type
----------------------------------------------------------------------


ALTER TABLE permission_user
    ADD CONSTRAINT permission_user_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;
ALTER TABLE permission_user
    ADD CONSTRAINT permission_user_FK_2 FOREIGN KEY (permission_id)
    REFERENCES permission (id)
;

----------------------------------------------------------------------
-- permission_user
----------------------------------------------------------------------


ALTER TABLE pluggable_task
    ADD CONSTRAINT pluggable_task_FK_1 FOREIGN KEY (type_id)
    REFERENCES pluggable_task_type (id)
;
ALTER TABLE pluggable_task
    ADD CONSTRAINT pluggable_task_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- pluggable_task
----------------------------------------------------------------------


ALTER TABLE pluggable_task_parameter
    ADD CONSTRAINT pluggable_task_parameter_FK_1 FOREIGN KEY (task_id)
    REFERENCES pluggable_task (id)
;

----------------------------------------------------------------------
-- pluggable_task_parameter
----------------------------------------------------------------------


ALTER TABLE pluggable_task_type
    ADD CONSTRAINT pluggable_task_type_FK_1 FOREIGN KEY (category_id)
    REFERENCES pluggable_task_type_category (id)
;

----------------------------------------------------------------------
-- pluggable_task_type
----------------------------------------------------------------------



----------------------------------------------------------------------
-- pluggable_task_type_category
----------------------------------------------------------------------


ALTER TABLE preference
    ADD CONSTRAINT preference_FK_1 FOREIGN KEY (type_id)
    REFERENCES preference_type (id)
;
ALTER TABLE preference
    ADD CONSTRAINT preference_FK_2 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
;

----------------------------------------------------------------------
-- preference
----------------------------------------------------------------------



----------------------------------------------------------------------
-- preference_type
----------------------------------------------------------------------


ALTER TABLE promotion
    ADD CONSTRAINT promotion_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;

----------------------------------------------------------------------
-- promotion
----------------------------------------------------------------------


ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
;
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_2 FOREIGN KEY (billing_type_id)
    REFERENCES order_billing_type (id)
;
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_3 FOREIGN KEY (period_id)
    REFERENCES order_period (id)
;
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_4 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_5 FOREIGN KEY (created_by)
    REFERENCES base_user (id)
;
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_6 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;

----------------------------------------------------------------------
-- purchase_order
----------------------------------------------------------------------



----------------------------------------------------------------------
-- recent_item
----------------------------------------------------------------------


ALTER TABLE report
    ADD CONSTRAINT report_FK_1 FOREIGN KEY (type_id)
    REFERENCES report_type (id)
;

----------------------------------------------------------------------
-- report
----------------------------------------------------------------------



----------------------------------------------------------------------
-- report_type
----------------------------------------------------------------------


ALTER TABLE report_parameter
    ADD CONSTRAINT report_parameter_FK_1 FOREIGN KEY (report_id)
    REFERENCES report (id)
;

----------------------------------------------------------------------
-- report_parameter
----------------------------------------------------------------------


ALTER TABLE entity_report_map
    ADD CONSTRAINT entity_report_map_FK_1 FOREIGN KEY (report_id)
    REFERENCES report (id)
;
ALTER TABLE entity_report_map
    ADD CONSTRAINT entity_report_map_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- entity_report_map
----------------------------------------------------------------------


ALTER TABLE role
    ADD CONSTRAINT role_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- role
----------------------------------------------------------------------



----------------------------------------------------------------------
-- user_credit_card_map
----------------------------------------------------------------------


ALTER TABLE user_role_map
    ADD CONSTRAINT user_role_map_FK_1 FOREIGN KEY (role_id)
    REFERENCES role (id)
;
ALTER TABLE user_role_map
    ADD CONSTRAINT user_role_map_FK_2 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;

----------------------------------------------------------------------
-- user_role_map
----------------------------------------------------------------------


ALTER TABLE mediation_cfg
    ADD CONSTRAINT mediation_cfg_FK_1 FOREIGN KEY (pluggable_task_id)
    REFERENCES pluggable_task (id)
;

----------------------------------------------------------------------
-- mediation_cfg
----------------------------------------------------------------------


ALTER TABLE mediation_process
    ADD CONSTRAINT mediation_process_FK_1 FOREIGN KEY (configuration_id)
    REFERENCES mediation_cfg (id)
;

----------------------------------------------------------------------
-- mediation_process
----------------------------------------------------------------------


ALTER TABLE mediation_order_map
    ADD CONSTRAINT mediation_order_map_FK_1 FOREIGN KEY (mediation_process_id)
    REFERENCES mediation_process (id)
;
ALTER TABLE mediation_order_map
    ADD CONSTRAINT mediation_order_map_FK_2 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
;

----------------------------------------------------------------------
-- mediation_order_map
----------------------------------------------------------------------


ALTER TABLE mediation_record
    ADD CONSTRAINT mediation_record_FK_1 FOREIGN KEY (mediation_process_id)
    REFERENCES mediation_process (id)
;
ALTER TABLE mediation_record
    ADD CONSTRAINT mediation_record_FK_2 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
;

----------------------------------------------------------------------
-- mediation_record
----------------------------------------------------------------------


ALTER TABLE mediation_record_line
    ADD CONSTRAINT mediation_record_line_FK_1 FOREIGN KEY (mediation_record_id)
    REFERENCES mediation_record (id)
;
ALTER TABLE mediation_record_line
    ADD CONSTRAINT mediation_record_line_FK_2 FOREIGN KEY (order_line_id)
    REFERENCES order_line (id)
;

----------------------------------------------------------------------
-- mediation_record_line
----------------------------------------------------------------------


ALTER TABLE blacklist
    ADD CONSTRAINT blacklist_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;
ALTER TABLE blacklist
    ADD CONSTRAINT blacklist_FK_2 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
;
ALTER TABLE blacklist
    ADD CONSTRAINT blacklist_FK_3 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- blacklist
----------------------------------------------------------------------



----------------------------------------------------------------------
-- generic_status_type
----------------------------------------------------------------------


ALTER TABLE generic_status
    ADD CONSTRAINT generic_status_FK_1 FOREIGN KEY (dtype)
    REFERENCES generic_status_type (id)
;

----------------------------------------------------------------------
-- generic_status
----------------------------------------------------------------------



----------------------------------------------------------------------
-- shortcut
----------------------------------------------------------------------


ALTER TABLE meta_field_name
    ADD CONSTRAINT meta_field_name_FK_1 FOREIGN KEY (default_value_id)
    REFERENCES meta_field_value (id)
;
ALTER TABLE meta_field_name
    ADD CONSTRAINT meta_field_name_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
;

----------------------------------------------------------------------
-- meta_field_name
----------------------------------------------------------------------


ALTER TABLE meta_field_value
    ADD CONSTRAINT meta_field_value_FK_1 FOREIGN KEY (meta_field_name_id)
    REFERENCES meta_field_name (id)
;

----------------------------------------------------------------------
-- meta_field_value
----------------------------------------------------------------------


ALTER TABLE customer_meta_field_map
    ADD CONSTRAINT customer_meta_field_map_FK_1 FOREIGN KEY (customer_id)
    REFERENCES customer (id)
;
ALTER TABLE customer_meta_field_map
    ADD CONSTRAINT customer_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- customer_meta_field_map
----------------------------------------------------------------------


ALTER TABLE partner_meta_field_map
    ADD CONSTRAINT partner_meta_field_map_FK_1 FOREIGN KEY (partner_id)
    REFERENCES partner (id)
;
ALTER TABLE partner_meta_field_map
    ADD CONSTRAINT partner_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- partner_meta_field_map
----------------------------------------------------------------------


ALTER TABLE order_meta_field_map
    ADD CONSTRAINT order_meta_field_map_FK_1 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
;
ALTER TABLE order_meta_field_map
    ADD CONSTRAINT order_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- order_meta_field_map
----------------------------------------------------------------------


ALTER TABLE item_meta_field_map
    ADD CONSTRAINT item_meta_field_map_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
;
ALTER TABLE item_meta_field_map
    ADD CONSTRAINT item_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- item_meta_field_map
----------------------------------------------------------------------


ALTER TABLE invoice_meta_field_map
    ADD CONSTRAINT invoice_meta_field_map_FK_1 FOREIGN KEY (invoice_id)
    REFERENCES invoice (id)
;
ALTER TABLE invoice_meta_field_map
    ADD CONSTRAINT invoice_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- invoice_meta_field_map
----------------------------------------------------------------------


ALTER TABLE payment_meta_field_map
    ADD CONSTRAINT payment_meta_field_map_FK_1 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
;
ALTER TABLE payment_meta_field_map
    ADD CONSTRAINT payment_meta_field_map_FK_2 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;

----------------------------------------------------------------------
-- payment_meta_field_map
----------------------------------------------------------------------


ALTER TABLE list_meta_field_values
    ADD CONSTRAINT list_meta_field_values_FK_1 FOREIGN KEY (meta_field_value_id)
    REFERENCES meta_field_value (id)
;
