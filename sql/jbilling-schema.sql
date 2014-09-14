
-----------------------------------------------------------------------------
-- ach
-----------------------------------------------------------------------------
DROP TABLE ach CASCADE;



CREATE TABLE ach
(
    id INTEGER NOT NULL,
    user_id INTEGER,
    aba_routing VARCHAR(40) NOT NULL,
    bank_account VARCHAR(60) NOT NULL,
    account_type INTEGER NOT NULL,
    bank_name VARCHAR(50) NOT NULL,
    account_name VARCHAR(100) NOT NULL,
    gateway_key VARCHAR(100),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ach_i_2 ON ach (user_id);




-----------------------------------------------------------------------------
-- ageing_entity_step
-----------------------------------------------------------------------------
DROP TABLE ageing_entity_step CASCADE;



CREATE TABLE ageing_entity_step
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    status_id INTEGER,
    days INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- base_user
-----------------------------------------------------------------------------
DROP TABLE base_user CASCADE;



CREATE TABLE base_user
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    password VARCHAR(40),
    deleted INT2 default 0 NOT NULL,
    language_id INTEGER,
    status_id INTEGER,
    subscriber_status INTEGER default 1,
    currency_id INTEGER,
    create_datetime TIMESTAMP NOT NULL,
    last_status_change TIMESTAMP,
    last_login TIMESTAMP,
    user_name VARCHAR(50),
    failed_attempts INTEGER default 0 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_username UNIQUE (entity_id, user_name, status_id)
);
CREATE INDEX ix_base_user_un ON base_user (entity_id, user_name);




-----------------------------------------------------------------------------
-- billing_process
-----------------------------------------------------------------------------
DROP TABLE billing_process CASCADE;



CREATE TABLE billing_process
(
    id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    billing_date DATE NOT NULL,
    period_unit_id INTEGER NOT NULL,
    period_value INTEGER NOT NULL,
    is_review INTEGER NOT NULL,
    paper_invoice_batch_id INTEGER,
    retries_to_do INTEGER default 0 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- billing_process_configuration
-----------------------------------------------------------------------------
DROP TABLE billing_process_configuration CASCADE;



CREATE TABLE billing_process_configuration
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    next_run_date DATE NOT NULL,
    generate_report INT2 NOT NULL,
    retries INTEGER,
    days_for_retry INTEGER,
    days_for_report INTEGER,
    review_status INTEGER NOT NULL,
    period_unit_id INTEGER NOT NULL,
    period_value INTEGER NOT NULL,
    due_date_unit_id INTEGER NOT NULL,
    due_date_value INTEGER NOT NULL,
    df_fm INT2,
    only_recurring INT2 default 1 NOT NULL,
    invoice_date_process INT2 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    auto_payment INT2 default 0 NOT NULL,
    maximum_periods INTEGER default 1 NOT NULL,
    auto_payment_application INTEGER default 0 NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- breadcrumb
-----------------------------------------------------------------------------
DROP TABLE breadcrumb CASCADE;



CREATE TABLE breadcrumb
(
    id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    controller VARCHAR(255) NOT NULL,
    action VARCHAR(255),
    name VARCHAR(255),
    object_id INTEGER,
    description VARCHAR(255),
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- process_run
-----------------------------------------------------------------------------
DROP TABLE process_run CASCADE;



CREATE TABLE process_run
(
    id INTEGER NOT NULL,
    process_id INTEGER,
    run_date DATE NOT NULL,
    started TIMESTAMP NOT NULL,
    finished TIMESTAMP,
    payment_finished TIMESTAMP,
    invoices_generated INTEGER,
    OPTLOCK INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX bp_run_process_ix ON process_run (process_id);




-----------------------------------------------------------------------------
-- process_run_total
-----------------------------------------------------------------------------
DROP TABLE process_run_total CASCADE;



CREATE TABLE process_run_total
(
    id INTEGER NOT NULL,
    process_run_id INTEGER,
    currency_id INTEGER NOT NULL,
    total_invoiced NUMERIC(22,10),
    total_paid NUMERIC(22,10),
    total_not_paid NUMERIC(22,10),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX bp_run_total_run_ix ON process_run_total (process_run_id);




-----------------------------------------------------------------------------
-- process_run_total_pm
-----------------------------------------------------------------------------
DROP TABLE process_run_total_pm CASCADE;



CREATE TABLE process_run_total_pm
(
    id INTEGER NOT NULL,
    process_run_total_id INTEGER,
    payment_method_id INTEGER,
    total NUMERIC(22,10) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX bp_pm_index_total ON process_run_total_pm (process_run_total_id);




-----------------------------------------------------------------------------
-- process_run_user
-----------------------------------------------------------------------------
DROP TABLE process_run_user CASCADE;



CREATE TABLE process_run_user
(
    id INTEGER NOT NULL,
    process_run_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    status INTEGER NOT NULL,
    created DATE NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX bp_run_user_run_ix ON process_run_user (process_run_id, user_id);




-----------------------------------------------------------------------------
-- contact
-----------------------------------------------------------------------------
DROP TABLE contact CASCADE;



CREATE TABLE contact
(
    id INTEGER NOT NULL,
    organization_name VARCHAR(200),
    street_addres1 VARCHAR(100),
    street_addres2 VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(30),
    postal_code VARCHAR(15),
    country_code VARCHAR(2),
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    person_initial VARCHAR(5),
    person_title VARCHAR(40),
    phone_country_code INTEGER,
    phone_area_code INTEGER,
    phone_phone_number VARCHAR(20),
    fax_country_code INTEGER,
    fax_area_code INTEGER,
    fax_phone_number VARCHAR(20),
    email VARCHAR(200),
    create_datetime TIMESTAMP NOT NULL,
    deleted INT2 default 0 NOT NULL,
    notification_include INT2 default 1,
    user_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_contact_fname ON contact (first_name);
CREATE INDEX ix_contact_lname ON contact (last_name);
CREATE INDEX ix_contact_orgname ON contact (organization_name);
CREATE INDEX contact_i_del ON contact (deleted);
CREATE INDEX ix_contact_fname_lname ON contact (first_name, last_name);
CREATE INDEX ix_contact_address ON contact (street_addres1, city, postal_code, street_addres2, state_province, country_code);
CREATE INDEX ix_contact_phone ON contact (phone_phone_number, phone_area_code, phone_country_code);
CREATE INDEX ix_user ON contact (user_id);




-----------------------------------------------------------------------------
-- contact_map
-----------------------------------------------------------------------------
DROP TABLE contact_map CASCADE;



CREATE TABLE contact_map
(
    id INTEGER NOT NULL,
    contact_id INTEGER,
    type_id INTEGER NOT NULL,
    table_id INTEGER NOT NULL,
    foreign_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX contact_map_i_3 ON contact_map (contact_id);
CREATE INDEX contact_map_i_1 ON contact_map (table_id, foreign_id, type_id);




-----------------------------------------------------------------------------
-- contact_type
-----------------------------------------------------------------------------
DROP TABLE contact_type CASCADE;



CREATE TABLE contact_type
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    is_primary INT2,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- country
-----------------------------------------------------------------------------
DROP TABLE country CASCADE;



CREATE TABLE country
(
    id INTEGER NOT NULL,
    code VARCHAR(2) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- credit_card
-----------------------------------------------------------------------------
DROP TABLE credit_card CASCADE;



CREATE TABLE credit_card
(
    id INTEGER NOT NULL,
    cc_number VARCHAR(100) NOT NULL,
    cc_number_plain VARCHAR(20),
    cc_expiry DATE NOT NULL,
    name VARCHAR(150),
    cc_type INTEGER NOT NULL,
    deleted INT2 default 0 NOT NULL,
    gateway_key VARCHAR(100),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_cc_number ON credit_card (cc_number_plain);
CREATE INDEX ix_cc_number_encrypted ON credit_card (cc_number);




-----------------------------------------------------------------------------
-- currency
-----------------------------------------------------------------------------
DROP TABLE currency CASCADE;



CREATE TABLE currency
(
    id INTEGER NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    code VARCHAR(3) NOT NULL,
    country_code VARCHAR(2) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- currency_entity_map
-----------------------------------------------------------------------------
DROP TABLE currency_entity_map CASCADE;



CREATE TABLE currency_entity_map
(
    currency_id INTEGER,
    entity_id INTEGER
);
CREATE INDEX currency_entity_map_i_2 ON currency_entity_map (currency_id, entity_id);




-----------------------------------------------------------------------------
-- currency_exchange
-----------------------------------------------------------------------------
DROP TABLE currency_exchange CASCADE;



CREATE TABLE currency_exchange
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    currency_id INTEGER,
    rate NUMERIC(22,10) NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    valid_since DATE NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- customer
-----------------------------------------------------------------------------
DROP TABLE customer CASCADE;



CREATE TABLE customer
(
    id INTEGER NOT NULL,
    user_id INTEGER,
    partner_id INTEGER,
    referral_fee_paid INT2,
    invoice_delivery_method_id INTEGER NOT NULL,
    notes VARCHAR(1000),
    auto_payment_type INTEGER,
    due_date_unit_id INTEGER,
    due_date_value INTEGER,
    df_fm INT2,
    parent_id INTEGER,
    is_parent INT2,
    exclude_aging INT2 default 0 NOT NULL,
    invoice_child INT2,
    use_parent_pricing BOOLEAN NOT NULL,
    current_order_id INTEGER,
    balance_type INTEGER default 1 NOT NULL,
    dynamic_balance NUMERIC(22,10),
    credit_limit NUMERIC(22,10),
    auto_recharge NUMERIC(22,10),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX customer_i_2 ON customer (user_id);




-----------------------------------------------------------------------------
-- entity
-----------------------------------------------------------------------------
DROP TABLE entity CASCADE;



CREATE TABLE entity
(
    id INTEGER NOT NULL,
    external_id VARCHAR(20),
    description VARCHAR(100) NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    language_id INTEGER NOT NULL,
    currency_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- entity_delivery_method_map
-----------------------------------------------------------------------------
DROP TABLE entity_delivery_method_map CASCADE;



CREATE TABLE entity_delivery_method_map
(
    method_id INTEGER,
    entity_id INTEGER
);




-----------------------------------------------------------------------------
-- entity_payment_method_map
-----------------------------------------------------------------------------
DROP TABLE entity_payment_method_map CASCADE;



CREATE TABLE entity_payment_method_map
(
    entity_id INTEGER,
    payment_method_id INTEGER
);




-----------------------------------------------------------------------------
-- event_log
-----------------------------------------------------------------------------
DROP TABLE event_log CASCADE;



CREATE TABLE event_log
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    user_id INTEGER,
    affected_user_id INTEGER,
    table_id INTEGER,
    foreign_id INTEGER NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    level_field INTEGER NOT NULL,
    module_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    old_num INTEGER,
    old_str VARCHAR(1000),
    old_date TIMESTAMP,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_el_main ON event_log (module_id, message_id, create_datetime);




-----------------------------------------------------------------------------
-- event_log_message
-----------------------------------------------------------------------------
DROP TABLE event_log_message CASCADE;



CREATE TABLE event_log_message
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- event_log_module
-----------------------------------------------------------------------------
DROP TABLE event_log_module CASCADE;



CREATE TABLE event_log_module
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- filter
-----------------------------------------------------------------------------
DROP TABLE filter CASCADE;



CREATE TABLE filter
(
    id INTEGER NOT NULL,
    filter_set_id INTEGER NOT NULL,
    type VARCHAR(255) NOT NULL,
    constraint_type VARCHAR(255) NOT NULL,
    field VARCHAR(255) NOT NULL,
    template VARCHAR(255) NOT NULL,
    visible BOOLEAN NOT NULL,
    integer_value INTEGER,
    string_value VARCHAR(255),
    start_date_value TIMESTAMP,
    end_date_value TIMESTAMP,
    boolean_value BOOLEAN,
    decimal_value NUMERIC(22,10),
    decimal_high_value NUMERIC(22,10),
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- filter_set
-----------------------------------------------------------------------------
DROP TABLE filter_set CASCADE;



CREATE TABLE filter_set
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- international_description
-----------------------------------------------------------------------------
DROP TABLE international_description CASCADE;



CREATE TABLE international_description
(
    table_id INTEGER NOT NULL,
    foreign_id INTEGER NOT NULL,
    psudo_column VARCHAR(20) NOT NULL,
    language_id INTEGER NOT NULL,
    content VARCHAR(4000) NOT NULL,
    PRIMARY KEY (table_id,foreign_id,psudo_column,language_id)
);
CREATE INDEX international_description_i_2 ON international_description (table_id, foreign_id, language_id);
CREATE INDEX int_description_i_lan ON international_description (language_id);




-----------------------------------------------------------------------------
-- invoice
-----------------------------------------------------------------------------
DROP TABLE invoice CASCADE;



CREATE TABLE invoice
(
    id INTEGER NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    billing_process_id INTEGER,
    user_id INTEGER,
    status_id INTEGER NOT NULL,
    delegated_invoice_id INTEGER,
    due_date DATE NOT NULL,
    total NUMERIC(22,10) NOT NULL,
    payment_attempts INTEGER default 0 NOT NULL,
    balance NUMERIC(22,10),
    carried_balance NUMERIC(22,10) NOT NULL,
    in_process_payment INT2 default 1 NOT NULL,
    is_review INTEGER NOT NULL,
    currency_id INTEGER NOT NULL,
    deleted INT2 default 0 NOT NULL,
    paper_invoice_batch_id INTEGER,
    customer_notes VARCHAR(1000),
    public_number VARCHAR(40),
    last_reminder DATE,
    overdue_step INTEGER,
    create_timestamp TIMESTAMP NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_invoice_user_id ON invoice (user_id, deleted);
CREATE INDEX ix_invoice_date ON invoice (create_datetime);
CREATE INDEX ix_invoice_number ON invoice (user_id, public_number);
CREATE INDEX ix_invoice_due_date ON invoice (user_id, due_date);
CREATE INDEX ix_invoice_ts ON invoice (create_timestamp, user_id);
CREATE INDEX ix_invoice_process ON invoice (billing_process_id);




-----------------------------------------------------------------------------
-- invoice_delivery_method
-----------------------------------------------------------------------------
DROP TABLE invoice_delivery_method CASCADE;



CREATE TABLE invoice_delivery_method
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- invoice_line
-----------------------------------------------------------------------------
DROP TABLE invoice_line CASCADE;



CREATE TABLE invoice_line
(
    id INTEGER NOT NULL,
    invoice_id INTEGER,
    type_id INTEGER,
    amount NUMERIC(22,10) NOT NULL,
    quantity NUMERIC(22,10),
    price NUMERIC(22,10),
    deleted INT2 default 0 NOT NULL,
    item_id INTEGER,
    description VARCHAR(1000),
    source_user_id INTEGER,
    is_percentage INT2 default 0 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_invoice_line_invoice_id ON invoice_line (invoice_id);




-----------------------------------------------------------------------------
-- invoice_line_type
-----------------------------------------------------------------------------
DROP TABLE invoice_line_type CASCADE;



CREATE TABLE invoice_line_type
(
    id INTEGER NOT NULL,
    description VARCHAR(50) NOT NULL,
    order_position INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- item
-----------------------------------------------------------------------------
DROP TABLE item CASCADE;



CREATE TABLE item
(
    id INTEGER NOT NULL,
    internal_number VARCHAR(50),
    entity_id INTEGER,
    percentage NUMERIC(22,10),
    deleted INT2 default 0 NOT NULL,
    has_decimals INT2 default 0 NOT NULL,
    gl_code VARCHAR(50),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_item_ent ON item (entity_id, internal_number);




-----------------------------------------------------------------------------
-- item_price_timeline
-----------------------------------------------------------------------------
DROP TABLE item_price_timeline CASCADE;



CREATE TABLE item_price_timeline
(
    item_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    price_model_id INTEGER NOT NULL,
    PRIMARY KEY (item_id,start_date),
    CONSTRAINT item_price_timeline_U_1 UNIQUE (price_model_id)
);




-----------------------------------------------------------------------------
-- item_type
-----------------------------------------------------------------------------
DROP TABLE item_type CASCADE;



CREATE TABLE item_type
(
    id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    description VARCHAR(100),
    internal BOOLEAN NOT NULL,
    order_line_type_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- item_type_map
-----------------------------------------------------------------------------
DROP TABLE item_type_map CASCADE;



CREATE TABLE item_type_map
(
    item_id INTEGER,
    type_id INTEGER
);




-----------------------------------------------------------------------------
-- item_type_exclude_map
-----------------------------------------------------------------------------
DROP TABLE item_type_exclude_map CASCADE;



CREATE TABLE item_type_exclude_map
(
    item_id INTEGER,
    type_id INTEGER
);




-----------------------------------------------------------------------------
-- price_model
-----------------------------------------------------------------------------
DROP TABLE price_model CASCADE;



CREATE TABLE price_model
(
    id INTEGER NOT NULL,
    strategy_type VARCHAR(40) NOT NULL,
    rate NUMERIC(22,10),
    currency_id INTEGER,
    next_model_id INTEGER,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- price_model_attribute
-----------------------------------------------------------------------------
DROP TABLE price_model_attribute CASCADE;



CREATE TABLE price_model_attribute
(
    price_model_id INTEGER NOT NULL,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255),
    PRIMARY KEY (price_model_id,attribute_name)
);




-----------------------------------------------------------------------------
-- plan
-----------------------------------------------------------------------------
DROP TABLE plan CASCADE;



CREATE TABLE plan
(
    id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    period_id INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- plan_item
-----------------------------------------------------------------------------
DROP TABLE plan_item CASCADE;



CREATE TABLE plan_item
(
    id INTEGER NOT NULL,
    plan_id INTEGER,
    item_id INTEGER NOT NULL,
    plan_item_bundle_id INTEGER,
    precedence INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX plan_item_precedence_i ON plan_item (precedence);
CREATE INDEX plan_item_item_id_i ON plan_item (item_id);




-----------------------------------------------------------------------------
-- plan_item_price_timeline
-----------------------------------------------------------------------------
DROP TABLE plan_item_price_timeline CASCADE;



CREATE TABLE plan_item_price_timeline
(
    plan_item_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    price_model_id INTEGER NOT NULL,
    PRIMARY KEY (plan_item_id,start_date),
    CONSTRAINT plan_item_price_timeline_U_1 UNIQUE (price_model_id)
);




-----------------------------------------------------------------------------
-- plan_item_bundle
-----------------------------------------------------------------------------
DROP TABLE plan_item_bundle CASCADE;



CREATE TABLE plan_item_bundle
(
    id INTEGER NOT NULL,
    quantity NUMERIC(22,10) NOT NULL,
    period_id INTEGER NOT NULL,
    target_customer VARCHAR(20) NOT NULL,
    add_if_exists BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- customer_price
-----------------------------------------------------------------------------
DROP TABLE customer_price CASCADE;



CREATE TABLE customer_price
(
    plan_item_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    PRIMARY KEY (plan_item_id,user_id)
);




-----------------------------------------------------------------------------
-- rate_card
-----------------------------------------------------------------------------
DROP TABLE rate_card CASCADE;



CREATE TABLE rate_card
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    entity_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT rate_card_U_1 UNIQUE (table_name)
);




-----------------------------------------------------------------------------
-- jbilling_table
-----------------------------------------------------------------------------
DROP TABLE jbilling_table CASCADE;



CREATE TABLE jbilling_table
(
    id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- jbilling_seqs
-----------------------------------------------------------------------------
DROP TABLE jbilling_seqs CASCADE;



CREATE TABLE jbilling_seqs
(
    name VARCHAR(50) NOT NULL,
    next_id INTEGER default 0 NOT NULL
);




-----------------------------------------------------------------------------
-- language
-----------------------------------------------------------------------------
DROP TABLE language CASCADE;



CREATE TABLE language
(
    id INTEGER NOT NULL,
    code VARCHAR(2) NOT NULL,
    description VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message
-----------------------------------------------------------------------------
DROP TABLE notification_message CASCADE;



CREATE TABLE notification_message
(
    id INTEGER NOT NULL,
    type_id INTEGER,
    entity_id INTEGER NOT NULL,
    language_id INTEGER NOT NULL,
    use_flag INT2 default 1 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message_arch
-----------------------------------------------------------------------------
DROP TABLE notification_message_arch CASCADE;



CREATE TABLE notification_message_arch
(
    id INTEGER NOT NULL,
    type_id INTEGER,
    create_datetime TIMESTAMP NOT NULL,
    user_id INTEGER,
    result_message VARCHAR(200),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message_arch_line
-----------------------------------------------------------------------------
DROP TABLE notification_message_arch_line CASCADE;



CREATE TABLE notification_message_arch_line
(
    id INTEGER NOT NULL,
    message_archive_id INTEGER,
    section INTEGER NOT NULL,
    content VARCHAR(1000) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message_line
-----------------------------------------------------------------------------
DROP TABLE notification_message_line CASCADE;



CREATE TABLE notification_message_line
(
    id INTEGER NOT NULL,
    message_section_id INTEGER,
    content VARCHAR(1000) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message_section
-----------------------------------------------------------------------------
DROP TABLE notification_message_section CASCADE;



CREATE TABLE notification_message_section
(
    id INTEGER NOT NULL,
    message_id INTEGER,
    section INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_message_type
-----------------------------------------------------------------------------
DROP TABLE notification_message_type CASCADE;



CREATE TABLE notification_message_type
(
    id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- notification_category
-----------------------------------------------------------------------------
DROP TABLE notification_category CASCADE;



CREATE TABLE notification_category
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- order_billing_type
-----------------------------------------------------------------------------
DROP TABLE order_billing_type CASCADE;



CREATE TABLE order_billing_type
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- order_line
-----------------------------------------------------------------------------
DROP TABLE order_line CASCADE;



CREATE TABLE order_line
(
    id INTEGER NOT NULL,
    order_id INTEGER,
    item_id INTEGER,
    type_id INTEGER,
    amount NUMERIC(22,10) NOT NULL,
    quantity NUMERIC(22,10),
    price NUMERIC(22,10),
    item_price INT2,
    create_datetime TIMESTAMP NOT NULL,
    deleted INT2 default 0 NOT NULL,
    use_item BOOLEAN NOT NULL,
    description VARCHAR(1000),
    provisioning_status INTEGER,
    provisioning_request_id VARCHAR(50),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_order_line_order_id ON order_line (order_id);
CREATE INDEX ix_order_line_item_id ON order_line (item_id);




-----------------------------------------------------------------------------
-- order_line_type
-----------------------------------------------------------------------------
DROP TABLE order_line_type CASCADE;



CREATE TABLE order_line_type
(
    id INTEGER NOT NULL,
    editable INT2 NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- order_period
-----------------------------------------------------------------------------
DROP TABLE order_period CASCADE;



CREATE TABLE order_period
(
    id INTEGER NOT NULL,
    entity_id INTEGER,
    value INTEGER,
    unit_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- order_process
-----------------------------------------------------------------------------
DROP TABLE order_process CASCADE;



CREATE TABLE order_process
(
    id INTEGER NOT NULL,
    order_id INTEGER,
    invoice_id INTEGER,
    billing_process_id INTEGER,
    periods_included INTEGER,
    period_start DATE,
    period_end DATE,
    is_review INTEGER NOT NULL,
    origin INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_uq_order_process_or_in ON order_process (order_id, invoice_id);
CREATE INDEX ix_uq_order_process_or_bp ON order_process (order_id, billing_process_id);
CREATE INDEX ix_order_process_in ON order_process (invoice_id);




-----------------------------------------------------------------------------
-- paper_invoice_batch
-----------------------------------------------------------------------------
DROP TABLE paper_invoice_batch CASCADE;



CREATE TABLE paper_invoice_batch
(
    id INTEGER NOT NULL,
    total_invoices INTEGER NOT NULL,
    delivery_date DATE,
    is_self_managed INT2 NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- partner
-----------------------------------------------------------------------------
DROP TABLE partner CASCADE;



CREATE TABLE partner
(
    id INTEGER NOT NULL,
    user_id INTEGER,
    balance NUMERIC(22,10) NOT NULL,
    total_payments NUMERIC(22,10) NOT NULL,
    total_refunds NUMERIC(22,10) NOT NULL,
    total_payouts NUMERIC(22,10) NOT NULL,
    percentage_rate NUMERIC(22,10),
    referral_fee NUMERIC(22,10),
    fee_currency_id INTEGER,
    one_time INT2 NOT NULL,
    period_unit_id INTEGER NOT NULL,
    period_value INTEGER NOT NULL,
    next_payout_date DATE NOT NULL,
    due_payout NUMERIC(22,10),
    automatic_process INT2 NOT NULL,
    related_clerk INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX partner_i_3 ON partner (user_id);




-----------------------------------------------------------------------------
-- partner_payout
-----------------------------------------------------------------------------
DROP TABLE partner_payout CASCADE;



CREATE TABLE partner_payout
(
    id INTEGER NOT NULL,
    starting_date DATE NOT NULL,
    ending_date DATE NOT NULL,
    payments_amount NUMERIC(22,10) NOT NULL,
    refunds_amount NUMERIC(22,10) NOT NULL,
    balance_left NUMERIC(22,10) NOT NULL,
    payment_id INTEGER,
    partner_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX partner_payout_i_2 ON partner_payout (partner_id);




-----------------------------------------------------------------------------
-- partner_range
-----------------------------------------------------------------------------
DROP TABLE partner_range CASCADE;



CREATE TABLE partner_range
(
    id INTEGER NOT NULL,
    partner_id INTEGER,
    percentage_rate NUMERIC(22,10),
    referral_fee NUMERIC(22,10),
    range_from INTEGER NOT NULL,
    range_to INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX partner_range_p ON partner_range (partner_id);




-----------------------------------------------------------------------------
-- payment
-----------------------------------------------------------------------------
DROP TABLE payment CASCADE;



CREATE TABLE payment
(
    id INTEGER NOT NULL,
    user_id INTEGER,
    attempt INTEGER,
    result_id INTEGER,
    amount NUMERIC(22,10) NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    update_datetime TIMESTAMP,
    payment_date DATE,
    method_id INTEGER NOT NULL,
    credit_card_id INTEGER,
    deleted INT2 default 0 NOT NULL,
    is_refund INT2 default 0 NOT NULL,
    is_preauth INT2 default 0 NOT NULL,
    payment_id INTEGER,
    currency_id INTEGER NOT NULL,
    payout_id INTEGER,
    ach_id INTEGER,
    balance NUMERIC(22,10),
    payment_period INTEGER,
    payment_notes VARCHAR(500),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX payment_i_2 ON payment (user_id, create_datetime);
CREATE INDEX payment_i_3 ON payment (user_id, balance);




-----------------------------------------------------------------------------
-- payment_authorization
-----------------------------------------------------------------------------
DROP TABLE payment_authorization CASCADE;



CREATE TABLE payment_authorization
(
    id INTEGER NOT NULL,
    payment_id INTEGER,
    processor VARCHAR(40) NOT NULL,
    code1 VARCHAR(40) NOT NULL,
    code2 VARCHAR(40),
    code3 VARCHAR(40),
    approval_code VARCHAR(20),
    avs VARCHAR(20),
    transaction_id VARCHAR(40),
    md5 VARCHAR(100),
    card_code VARCHAR(100),
    create_datetime DATE NOT NULL,
    response_message VARCHAR(200),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX create_datetime ON payment_authorization (create_datetime);
CREATE INDEX transaction_id ON payment_authorization (transaction_id);
CREATE INDEX ix_pa_payment ON payment_authorization (payment_id);




-----------------------------------------------------------------------------
-- payment_info_cheque
-----------------------------------------------------------------------------
DROP TABLE payment_info_cheque CASCADE;



CREATE TABLE payment_info_cheque
(
    id INTEGER NOT NULL,
    payment_id INTEGER,
    bank VARCHAR(50),
    cheque_number VARCHAR(50),
    cheque_date DATE,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- payment_invoice
-----------------------------------------------------------------------------
DROP TABLE payment_invoice CASCADE;



CREATE TABLE payment_invoice
(
    id INTEGER NOT NULL,
    payment_id INTEGER,
    invoice_id INTEGER,
    amount NUMERIC(22,10),
    create_datetime TIMESTAMP NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_uq_payment_inv_map_pa_in ON payment_invoice (payment_id, invoice_id);




-----------------------------------------------------------------------------
-- payment_method
-----------------------------------------------------------------------------
DROP TABLE payment_method CASCADE;



CREATE TABLE payment_method
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- payment_result
-----------------------------------------------------------------------------
DROP TABLE payment_result CASCADE;



CREATE TABLE payment_result
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- period_unit
-----------------------------------------------------------------------------
DROP TABLE period_unit CASCADE;



CREATE TABLE period_unit
(
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- enumeration
-----------------------------------------------------------------------------
DROP TABLE enumeration CASCADE;



CREATE TABLE enumeration
(
    id INTEGER NOT NULL,
    name VARCHAR(50),
    value VARCHAR(50),
    entity_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- enumeration_values
-----------------------------------------------------------------------------
DROP TABLE enumeration_values CASCADE;



CREATE TABLE enumeration_values
(
    id INTEGER NOT NULL,
    enumeration_id INTEGER,
    value VARCHAR(50),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- permission
-----------------------------------------------------------------------------
DROP TABLE permission CASCADE;



CREATE TABLE permission
(
    id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    foreign_id INTEGER,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- permission_role_map
-----------------------------------------------------------------------------
DROP TABLE permission_role_map CASCADE;



CREATE TABLE permission_role_map
(
    permission_id INTEGER,
    role_id INTEGER
);
CREATE INDEX permission_role_map_i_2 ON permission_role_map (permission_id, role_id);




-----------------------------------------------------------------------------
-- permission_type
-----------------------------------------------------------------------------
DROP TABLE permission_type CASCADE;



CREATE TABLE permission_type
(
    id INTEGER NOT NULL,
    description VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- permission_user
-----------------------------------------------------------------------------
DROP TABLE permission_user CASCADE;



CREATE TABLE permission_user
(
    permission_id INTEGER,
    user_id INTEGER,
    is_grant INT2 NOT NULL,
    id INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX permission_user_map_i_2 ON permission_user (permission_id, user_id);




-----------------------------------------------------------------------------
-- pluggable_task
-----------------------------------------------------------------------------
DROP TABLE pluggable_task CASCADE;



CREATE TABLE pluggable_task
(
    id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    type_id INTEGER,
    processing_order INTEGER NOT NULL,
    notes VARCHAR(1000),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- pluggable_task_parameter
-----------------------------------------------------------------------------
DROP TABLE pluggable_task_parameter CASCADE;



CREATE TABLE pluggable_task_parameter
(
    id INTEGER NOT NULL,
    task_id INTEGER,
    name VARCHAR(50) NOT NULL,
    int_value INTEGER,
    str_value VARCHAR(500),
    float_value NUMERIC(22,10),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- pluggable_task_type
-----------------------------------------------------------------------------
DROP TABLE pluggable_task_type CASCADE;



CREATE TABLE pluggable_task_type
(
    id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    class_name VARCHAR(200) NOT NULL,
    min_parameters INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- pluggable_task_type_category
-----------------------------------------------------------------------------
DROP TABLE pluggable_task_type_category CASCADE;



CREATE TABLE pluggable_task_type_category
(
    id INTEGER NOT NULL,
    interface_name VARCHAR(200) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- preference
-----------------------------------------------------------------------------
DROP TABLE preference CASCADE;



CREATE TABLE preference
(
    id INTEGER NOT NULL,
    type_id INTEGER,
    table_id INTEGER NOT NULL,
    foreign_id INTEGER NOT NULL,
    value VARCHAR(200),
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- preference_type
-----------------------------------------------------------------------------
DROP TABLE preference_type CASCADE;



CREATE TABLE preference_type
(
    id INTEGER NOT NULL,
    def_value VARCHAR(200),
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- promotion
-----------------------------------------------------------------------------
DROP TABLE promotion CASCADE;



CREATE TABLE promotion
(
    id INTEGER NOT NULL,
    item_id INTEGER,
    code VARCHAR(50) NOT NULL,
    notes VARCHAR(200),
    once INT2 NOT NULL,
    since DATE,
    until DATE,
    PRIMARY KEY (id)
);
CREATE INDEX ix_promotion_code ON promotion (code);




-----------------------------------------------------------------------------
-- purchase_order
-----------------------------------------------------------------------------
DROP TABLE purchase_order CASCADE;



CREATE TABLE purchase_order
(
    id INTEGER NOT NULL,
    user_id INTEGER,
    period_id INTEGER,
    billing_type_id INTEGER NOT NULL,
    active_since DATE,
    active_until DATE,
    cycle_start DATE,
    create_datetime TIMESTAMP NOT NULL,
    next_billable_day DATE,
    created_by INTEGER,
    status_id INTEGER NOT NULL,
    currency_id INTEGER NOT NULL,
    deleted INT2 default 0 NOT NULL,
    notify INT2,
    last_notified TIMESTAMP,
    notification_step INTEGER,
    due_date_unit_id INTEGER,
    due_date_value INTEGER,
    df_fm INT2,
    anticipate_periods INTEGER,
    own_invoice INT2,
    notes VARCHAR(200),
    notes_in_invoice INT2,
    is_current INT2,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX purchase_order_i_user ON purchase_order (user_id, deleted);
CREATE INDEX purchase_order_i_notif ON purchase_order (active_until, notification_step);
CREATE INDEX ix_purchase_order_date ON purchase_order (user_id, create_datetime);




-----------------------------------------------------------------------------
-- recent_item
-----------------------------------------------------------------------------
DROP TABLE recent_item CASCADE;



CREATE TABLE recent_item
(
    id INTEGER NOT NULL,
    type VARCHAR(255) NOT NULL,
    object_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- report
-----------------------------------------------------------------------------
DROP TABLE report CASCADE;



CREATE TABLE report
(
    id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- report_type
-----------------------------------------------------------------------------
DROP TABLE report_type CASCADE;



CREATE TABLE report_type
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- report_parameter
-----------------------------------------------------------------------------
DROP TABLE report_parameter CASCADE;



CREATE TABLE report_parameter
(
    id INTEGER NOT NULL,
    report_id INTEGER NOT NULL,
    dtype VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- entity_report_map
-----------------------------------------------------------------------------
DROP TABLE entity_report_map CASCADE;



CREATE TABLE entity_report_map
(
    report_id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    PRIMARY KEY (report_id,entity_id)
);




-----------------------------------------------------------------------------
-- role
-----------------------------------------------------------------------------
DROP TABLE role CASCADE;



CREATE TABLE role
(
    id INTEGER NOT NULL,
    role_type_id INTEGER,
    entity_id INTEGER,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- user_credit_card_map
-----------------------------------------------------------------------------
DROP TABLE user_credit_card_map CASCADE;



CREATE TABLE user_credit_card_map
(
    user_id INTEGER,
    credit_card_id INTEGER
);
CREATE INDEX user_credit_card_map_i_2 ON user_credit_card_map (user_id, credit_card_id);




-----------------------------------------------------------------------------
-- user_role_map
-----------------------------------------------------------------------------
DROP TABLE user_role_map CASCADE;



CREATE TABLE user_role_map
(
    user_id INTEGER,
    role_id INTEGER
);
CREATE INDEX user_role_map_i_2 ON user_role_map (user_id, role_id);
CREATE INDEX user_role_map_i_role ON user_role_map (role_id);




-----------------------------------------------------------------------------
-- mediation_cfg
-----------------------------------------------------------------------------
DROP TABLE mediation_cfg CASCADE;



CREATE TABLE mediation_cfg
(
    id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    name VARCHAR(50) NOT NULL,
    order_value INTEGER NOT NULL,
    pluggable_task_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- mediation_process
-----------------------------------------------------------------------------
DROP TABLE mediation_process CASCADE;



CREATE TABLE mediation_process
(
    id INTEGER NOT NULL,
    configuration_id INTEGER NOT NULL,
    start_datetime TIMESTAMP NOT NULL,
    end_datetime TIMESTAMP,
    orders_affected INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- mediation_order_map
-----------------------------------------------------------------------------
DROP TABLE mediation_order_map CASCADE;



CREATE TABLE mediation_order_map
(
    mediation_process_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- mediation_record
-----------------------------------------------------------------------------
DROP TABLE mediation_record CASCADE;



CREATE TABLE mediation_record
(
    id INTEGER NOT NULL,
    id_key VARCHAR(100) NOT NULL,
    start_datetime TIMESTAMP NOT NULL,
    mediation_process_id INTEGER,
    status_id INTEGER NOT NULL,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX mediation_record_i ON mediation_record (id, status_id);




-----------------------------------------------------------------------------
-- mediation_record_line
-----------------------------------------------------------------------------
DROP TABLE mediation_record_line CASCADE;



CREATE TABLE mediation_record_line
(
    id INTEGER NOT NULL,
    mediation_record_id INTEGER NOT NULL,
    order_line_id INTEGER NOT NULL,
    event_date TIMESTAMP NOT NULL,
    amount NUMERIC(22,10) NOT NULL,
    quantity NUMERIC(22,10) NOT NULL,
    description VARCHAR(200),
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_mrl_order_line ON mediation_record_line (order_line_id);




-----------------------------------------------------------------------------
-- blacklist
-----------------------------------------------------------------------------
DROP TABLE blacklist CASCADE;



CREATE TABLE blacklist
(
    id INTEGER NOT NULL,
    entity_id INTEGER NOT NULL,
    create_datetime TIMESTAMP NOT NULL,
    type INTEGER NOT NULL,
    source INTEGER NOT NULL,
    credit_card INTEGER,
    credit_card_id INTEGER,
    contact_id INTEGER,
    user_id INTEGER,
    meta_field_value_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ix_blacklist_user_type ON blacklist (user_id, type);
CREATE INDEX ix_blacklist_entity_type ON blacklist (entity_id, type);




-----------------------------------------------------------------------------
-- generic_status_type
-----------------------------------------------------------------------------
DROP TABLE generic_status_type CASCADE;



CREATE TABLE generic_status_type
(
    id VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- generic_status
-----------------------------------------------------------------------------
DROP TABLE generic_status CASCADE;



CREATE TABLE generic_status
(
    id INTEGER NOT NULL,
    dtype VARCHAR(40) NOT NULL,
    status_value INTEGER NOT NULL,
    can_login INT2,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- shortcut
-----------------------------------------------------------------------------
DROP TABLE shortcut CASCADE;



CREATE TABLE shortcut
(
    id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    controller VARCHAR(255) NOT NULL,
    action VARCHAR(255),
    name VARCHAR(255),
    object_id INTEGER,
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- meta_field_name
-----------------------------------------------------------------------------
DROP TABLE meta_field_name CASCADE;



CREATE TABLE meta_field_name
(
    id INTEGER NOT NULL,
    name VARCHAR(100),
    entity_id INTEGER,
    entity_type VARCHAR(25) NOT NULL,
    data_type VARCHAR(25) NOT NULL,
    is_disabled BOOLEAN,
    is_mandatory BOOLEAN,
    display_order INTEGER,
    default_value_id INTEGER,
    OPTLOCK INTEGER NOT NULL,
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- meta_field_value
-----------------------------------------------------------------------------
DROP TABLE meta_field_value CASCADE;



CREATE TABLE meta_field_value
(
    id INTEGER NOT NULL,
    meta_field_name_id INTEGER NOT NULL,
    dtype VARCHAR(10) NOT NULL,
    boolean_value BOOLEAN,
    date_value TIMESTAMP,
    decimal_value NUMERIC(22,10),
    integer_value INTEGER,
    string_value VARCHAR(1000),
    PRIMARY KEY (id)
);




-----------------------------------------------------------------------------
-- customer_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE customer_meta_field_map CASCADE;



CREATE TABLE customer_meta_field_map
(
    customer_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- partner_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE partner_meta_field_map CASCADE;



CREATE TABLE partner_meta_field_map
(
    partner_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- order_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE order_meta_field_map CASCADE;



CREATE TABLE order_meta_field_map
(
    order_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- item_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE item_meta_field_map CASCADE;



CREATE TABLE item_meta_field_map
(
    item_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- invoice_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE invoice_meta_field_map CASCADE;



CREATE TABLE invoice_meta_field_map
(
    invoice_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- payment_meta_field_map
-----------------------------------------------------------------------------
DROP TABLE payment_meta_field_map CASCADE;



CREATE TABLE payment_meta_field_map
(
    payment_id INTEGER NOT NULL,
    meta_field_value_id INTEGER NOT NULL
);




-----------------------------------------------------------------------------
-- list_meta_field_values
-----------------------------------------------------------------------------
DROP TABLE list_meta_field_values CASCADE;



CREATE TABLE list_meta_field_values
(
    meta_field_value_id INTEGER NOT NULL,
    list_value VARCHAR(255)
);




----------------------------------------------------------------------
-- list_meta_field_values
----------------------------------------------------------------------


