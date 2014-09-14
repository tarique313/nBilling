
/* ---------------------------------------------------------------------- */
/* ach                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='ach_FK_1')
    ALTER TABLE ach DROP CONSTRAINT ach_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'ach')
BEGIN
    DROP TABLE ach
END
;

CREATE TABLE ach
(
    id INT NOT NULL,
    user_id INT NULL,
    aba_routing VARCHAR (40) NOT NULL,
    bank_account VARCHAR (60) NOT NULL,
    account_type INT NOT NULL,
    bank_name VARCHAR (50) NOT NULL,
    account_name VARCHAR (100) NOT NULL,
    gateway_key VARCHAR (100) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT ach_PK PRIMARY KEY(id)
);

CREATE  INDEX ach_i_2 ON ach (user_id);

/* ---------------------------------------------------------------------- */
/* ageing_entity_step                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='ageing_entity_step_FK_1')
    ALTER TABLE ageing_entity_step DROP CONSTRAINT ageing_entity_step_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='ageing_entity_step_FK_2')
    ALTER TABLE ageing_entity_step DROP CONSTRAINT ageing_entity_step_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'ageing_entity_step')
BEGIN
    DROP TABLE ageing_entity_step
END
;

CREATE TABLE ageing_entity_step
(
    id INT NOT NULL,
    entity_id INT NULL,
    status_id INT NULL,
    days INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT ageing_entity_step_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* base_user                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='base_user_FK_1')
    ALTER TABLE base_user DROP CONSTRAINT base_user_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='base_user_FK_2')
    ALTER TABLE base_user DROP CONSTRAINT base_user_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='base_user_FK_3')
    ALTER TABLE base_user DROP CONSTRAINT base_user_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='base_user_FK_4')
    ALTER TABLE base_user DROP CONSTRAINT base_user_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='base_user_FK_5')
    ALTER TABLE base_user DROP CONSTRAINT base_user_FK_5;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'base_user')
BEGIN
    DROP TABLE base_user
END
;

CREATE TABLE base_user
(
    id INT NOT NULL,
    entity_id INT NULL,
    password VARCHAR (40) NULL,
    deleted SMALLINT default 0 NOT NULL,
    language_id INT NULL,
    status_id INT NULL,
    subscriber_status INT default 1 NULL,
    currency_id INT NULL,
    create_datetime DATETIME NOT NULL,
    last_status_change DATETIME NULL,
    last_login DATETIME NULL,
    user_name VARCHAR (50) NULL,
    failed_attempts INT default 0 NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT base_user_PK PRIMARY KEY(id),
    UNIQUE (entity_id, user_name, status_id)
);

CREATE  INDEX ix_base_user_un ON base_user (entity_id, user_name);

/* ---------------------------------------------------------------------- */
/* billing_process                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='billing_process_FK_1')
    ALTER TABLE billing_process DROP CONSTRAINT billing_process_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='billing_process_FK_2')
    ALTER TABLE billing_process DROP CONSTRAINT billing_process_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='billing_process_FK_3')
    ALTER TABLE billing_process DROP CONSTRAINT billing_process_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'billing_process')
BEGIN
    DROP TABLE billing_process
END
;

CREATE TABLE billing_process
(
    id INT NOT NULL,
    entity_id INT NOT NULL,
    billing_date DATETIME NOT NULL,
    period_unit_id INT NOT NULL,
    period_value INT NOT NULL,
    is_review INT NOT NULL,
    paper_invoice_batch_id INT NULL,
    retries_to_do INT default 0 NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT billing_process_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* billing_process_configuration                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='billing_process_configura_FK_1')
    ALTER TABLE billing_process_configuration DROP CONSTRAINT billing_process_configura_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='billing_process_configura_FK_2')
    ALTER TABLE billing_process_configuration DROP CONSTRAINT billing_process_configura_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'billing_process_configuration')
BEGIN
    DROP TABLE billing_process_configuration
END
;

CREATE TABLE billing_process_configuration
(
    id INT NOT NULL,
    entity_id INT NULL,
    next_run_date DATETIME NOT NULL,
    generate_report SMALLINT NOT NULL,
    retries INT NULL,
    days_for_retry INT NULL,
    days_for_report INT NULL,
    review_status INT NOT NULL,
    period_unit_id INT NOT NULL,
    period_value INT NOT NULL,
    due_date_unit_id INT NOT NULL,
    due_date_value INT NOT NULL,
    df_fm SMALLINT NULL,
    only_recurring SMALLINT default 1 NOT NULL,
    invoice_date_process SMALLINT NOT NULL,
    OPTLOCK INT NOT NULL,
    auto_payment SMALLINT default 0 NOT NULL,
    maximum_periods INT default 1 NOT NULL,
    auto_payment_application INT default 0 NOT NULL,
    CONSTRAINT billing_process_configuration_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* breadcrumb                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'breadcrumb')
BEGIN
    DROP TABLE breadcrumb
END
;

CREATE TABLE breadcrumb
(
    id INT NOT NULL,
    user_id INT NOT NULL,
    controller VARCHAR (255) NOT NULL,
    action VARCHAR (255) NULL,
    name VARCHAR (255) NULL,
    object_id INT NULL,
    description VARCHAR (255) NULL,
    version INT NOT NULL,
    CONSTRAINT breadcrumb_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* process_run                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_FK_1')
    ALTER TABLE process_run DROP CONSTRAINT process_run_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_FK_2')
    ALTER TABLE process_run DROP CONSTRAINT process_run_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'process_run')
BEGIN
    DROP TABLE process_run
END
;

CREATE TABLE process_run
(
    id INT NOT NULL,
    process_id INT NULL,
    run_date DATETIME NOT NULL,
    started DATETIME NOT NULL,
    finished DATETIME NULL,
    payment_finished DATETIME NULL,
    invoices_generated INT NULL,
    OPTLOCK INT NOT NULL,
    status_id INT NOT NULL,
    CONSTRAINT process_run_PK PRIMARY KEY(id)
);

CREATE  INDEX bp_run_process_ix ON process_run (process_id);

/* ---------------------------------------------------------------------- */
/* process_run_total                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_total_FK_1')
    ALTER TABLE process_run_total DROP CONSTRAINT process_run_total_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_total_FK_2')
    ALTER TABLE process_run_total DROP CONSTRAINT process_run_total_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'process_run_total')
BEGIN
    DROP TABLE process_run_total
END
;

CREATE TABLE process_run_total
(
    id INT NOT NULL,
    process_run_id INT NULL,
    currency_id INT NOT NULL,
    total_invoiced NUMERIC (22,10) NULL,
    total_paid NUMERIC (22,10) NULL,
    total_not_paid NUMERIC (22,10) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT process_run_total_PK PRIMARY KEY(id)
);

CREATE  INDEX bp_run_total_run_ix ON process_run_total (process_run_id);

/* ---------------------------------------------------------------------- */
/* process_run_total_pm                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_total_pm_FK_1')
    ALTER TABLE process_run_total_pm DROP CONSTRAINT process_run_total_pm_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'process_run_total_pm')
BEGIN
    DROP TABLE process_run_total_pm
END
;

CREATE TABLE process_run_total_pm
(
    id INT NOT NULL,
    process_run_total_id INT NULL,
    payment_method_id INT NULL,
    total NUMERIC (22,10) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT process_run_total_pm_PK PRIMARY KEY(id)
);

CREATE  INDEX bp_pm_index_total ON process_run_total_pm (process_run_total_id);

/* ---------------------------------------------------------------------- */
/* process_run_user                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_user_FK_1')
    ALTER TABLE process_run_user DROP CONSTRAINT process_run_user_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='process_run_user_FK_2')
    ALTER TABLE process_run_user DROP CONSTRAINT process_run_user_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'process_run_user')
BEGIN
    DROP TABLE process_run_user
END
;

CREATE TABLE process_run_user
(
    id INT NOT NULL,
    process_run_id INT NOT NULL,
    user_id INT NOT NULL,
    status INT NOT NULL,
    created DATETIME NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT process_run_user_PK PRIMARY KEY(id)
);

CREATE  INDEX bp_run_user_run_ix ON process_run_user (process_run_id, user_id);

/* ---------------------------------------------------------------------- */
/* contact                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'contact')
BEGIN
    DROP TABLE contact
END
;

CREATE TABLE contact
(
    id INT NOT NULL,
    organization_name VARCHAR (200) NULL,
    street_addres1 VARCHAR (100) NULL,
    street_addres2 VARCHAR (100) NULL,
    city VARCHAR (50) NULL,
    state_province VARCHAR (30) NULL,
    postal_code VARCHAR (15) NULL,
    country_code VARCHAR (2) NULL,
    last_name VARCHAR (30) NULL,
    first_name VARCHAR (30) NULL,
    person_initial VARCHAR (5) NULL,
    person_title VARCHAR (40) NULL,
    phone_country_code INT NULL,
    phone_area_code INT NULL,
    phone_phone_number VARCHAR (20) NULL,
    fax_country_code INT NULL,
    fax_area_code INT NULL,
    fax_phone_number VARCHAR (20) NULL,
    email VARCHAR (200) NULL,
    create_datetime DATETIME NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    notification_include SMALLINT default 1 NULL,
    user_id INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT contact_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_contact_fname ON contact (first_name);
CREATE  INDEX ix_contact_lname ON contact (last_name);
CREATE  INDEX ix_contact_orgname ON contact (organization_name);
CREATE  INDEX contact_i_del ON contact (deleted);
CREATE  INDEX ix_contact_fname_lname ON contact (first_name, last_name);
CREATE  INDEX ix_contact_address ON contact (street_addres1, city, postal_code, street_addres2, state_province, country_code);
CREATE  INDEX ix_contact_phone ON contact (phone_phone_number, phone_area_code, phone_country_code);
CREATE  INDEX ix_user ON contact (user_id);

/* ---------------------------------------------------------------------- */
/* contact_field                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_field_FK_1')
    ALTER TABLE contact_field DROP CONSTRAINT contact_field_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_field_FK_2')
    ALTER TABLE contact_field DROP CONSTRAINT contact_field_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'contact_field')
BEGIN
    DROP TABLE contact_field
END
;

CREATE TABLE contact_field
(
    id INT NOT NULL,
    type_id INT NULL,
    contact_id INT NULL,
    content VARCHAR (100) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT contact_field_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_contact_field_cid ON contact_field (contact_id);
CREATE  INDEX ix_contact_field_content ON contact_field (content);

/* ---------------------------------------------------------------------- */
/* contact_field_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_field_type_FK_1')
    ALTER TABLE contact_field_type DROP CONSTRAINT contact_field_type_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'contact_field_type')
BEGIN
    DROP TABLE contact_field_type
END
;

CREATE TABLE contact_field_type
(
    id INT NOT NULL,
    entity_id INT NULL,
    prompt_key VARCHAR (50) NOT NULL,
    data_type VARCHAR (10) NOT NULL,
    customer_readonly SMALLINT NULL,
    optlock INT NOT NULL,
    CONSTRAINT contact_field_type_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_cf_type_entity ON contact_field_type (entity_id);

/* ---------------------------------------------------------------------- */
/* contact_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_map_FK_1')
    ALTER TABLE contact_map DROP CONSTRAINT contact_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_map_FK_2')
    ALTER TABLE contact_map DROP CONSTRAINT contact_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_map_FK_3')
    ALTER TABLE contact_map DROP CONSTRAINT contact_map_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'contact_map')
BEGIN
    DROP TABLE contact_map
END
;

CREATE TABLE contact_map
(
    id INT NOT NULL,
    contact_id INT NULL,
    type_id INT NOT NULL,
    table_id INT NOT NULL,
    foreign_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT contact_map_PK PRIMARY KEY(id)
);

CREATE  INDEX contact_map_i_3 ON contact_map (contact_id);
CREATE  INDEX contact_map_i_1 ON contact_map (table_id, foreign_id, type_id);

/* ---------------------------------------------------------------------- */
/* contact_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='contact_type_FK_1')
    ALTER TABLE contact_type DROP CONSTRAINT contact_type_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'contact_type')
BEGIN
    DROP TABLE contact_type
END
;

CREATE TABLE contact_type
(
    id INT NOT NULL,
    entity_id INT NULL,
    is_primary SMALLINT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT contact_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* country                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'country')
BEGIN
    DROP TABLE country
END
;

CREATE TABLE country
(
    id INT NOT NULL,
    code VARCHAR (2) NOT NULL,
    CONSTRAINT country_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* credit_card                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'credit_card')
BEGIN
    DROP TABLE credit_card
END
;

CREATE TABLE credit_card
(
    id INT NOT NULL,
    cc_number VARCHAR (100) NOT NULL,
    cc_number_plain VARCHAR (20) NULL,
    cc_expiry DATETIME NOT NULL,
    name VARCHAR (150) NULL,
    cc_type INT NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    gateway_key VARCHAR (100) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT credit_card_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_cc_number ON credit_card (cc_number_plain);
CREATE  INDEX ix_cc_number_encrypted ON credit_card (cc_number);

/* ---------------------------------------------------------------------- */
/* currency                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'currency')
BEGIN
    DROP TABLE currency
END
;

CREATE TABLE currency
(
    id INT NOT NULL,
    symbol VARCHAR (10) NOT NULL,
    code VARCHAR (3) NOT NULL,
    country_code VARCHAR (2) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT currency_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* currency_entity_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='currency_entity_map_FK_1')
    ALTER TABLE currency_entity_map DROP CONSTRAINT currency_entity_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='currency_entity_map_FK_2')
    ALTER TABLE currency_entity_map DROP CONSTRAINT currency_entity_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'currency_entity_map')
BEGIN
    DROP TABLE currency_entity_map
END
;

CREATE TABLE currency_entity_map
(
    currency_id INT NULL,
    entity_id INT NULL,
);

CREATE  INDEX currency_entity_map_i_2 ON currency_entity_map (currency_id, entity_id);

/* ---------------------------------------------------------------------- */
/* currency_exchange                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='currency_exchange_FK_1')
    ALTER TABLE currency_exchange DROP CONSTRAINT currency_exchange_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'currency_exchange')
BEGIN
    DROP TABLE currency_exchange
END
;

CREATE TABLE currency_exchange
(
    id INT NOT NULL,
    entity_id INT NULL,
    currency_id INT NULL,
    rate NUMERIC (22,10) NOT NULL,
    create_datetime DATETIME NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT currency_exchange_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* customer                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='customer_FK_1')
    ALTER TABLE customer DROP CONSTRAINT customer_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='customer_FK_2')
    ALTER TABLE customer DROP CONSTRAINT customer_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='customer_FK_3')
    ALTER TABLE customer DROP CONSTRAINT customer_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'customer')
BEGIN
    DROP TABLE customer
END
;

CREATE TABLE customer
(
    id INT NOT NULL,
    user_id INT NULL,
    partner_id INT NULL,
    referral_fee_paid SMALLINT NULL,
    invoice_delivery_method_id INT NOT NULL,
    notes VARCHAR (1000) NULL,
    auto_payment_type INT NULL,
    due_date_unit_id INT NULL,
    due_date_value INT NULL,
    df_fm SMALLINT NULL,
    parent_id INT NULL,
    is_parent SMALLINT NULL,
    exclude_aging SMALLINT default 0 NOT NULL,
    invoice_child SMALLINT NULL,
    current_order_id INT NULL,
    balance_type INT default 1 NOT NULL,
    dynamic_balance NUMERIC (22,10) NULL,
    credit_limit NUMERIC (22,10) NULL,
    auto_recharge NUMERIC (22,10) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT customer_PK PRIMARY KEY(id)
);

CREATE  INDEX customer_i_2 ON customer (user_id);

/* ---------------------------------------------------------------------- */
/* entity                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_FK_1')
    ALTER TABLE entity DROP CONSTRAINT entity_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_FK_2')
    ALTER TABLE entity DROP CONSTRAINT entity_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'entity')
BEGIN
    DROP TABLE entity
END
;

CREATE TABLE entity
(
    id INT NOT NULL,
    external_id VARCHAR (20) NULL,
    description VARCHAR (100) NOT NULL,
    create_datetime DATETIME NOT NULL,
    language_id INT NOT NULL,
    currency_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT entity_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* entity_delivery_method_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_delivery_method_ma_FK_1')
    ALTER TABLE entity_delivery_method_map DROP CONSTRAINT entity_delivery_method_ma_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_delivery_method_ma_FK_2')
    ALTER TABLE entity_delivery_method_map DROP CONSTRAINT entity_delivery_method_ma_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'entity_delivery_method_map')
BEGIN
    DROP TABLE entity_delivery_method_map
END
;

CREATE TABLE entity_delivery_method_map
(
    method_id INT NULL,
    entity_id INT NULL,
);


/* ---------------------------------------------------------------------- */
/* entity_payment_method_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_payment_method_map_FK_1')
    ALTER TABLE entity_payment_method_map DROP CONSTRAINT entity_payment_method_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_payment_method_map_FK_2')
    ALTER TABLE entity_payment_method_map DROP CONSTRAINT entity_payment_method_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'entity_payment_method_map')
BEGIN
    DROP TABLE entity_payment_method_map
END
;

CREATE TABLE entity_payment_method_map
(
    entity_id INT NULL,
    payment_method_id INT NULL,
);


/* ---------------------------------------------------------------------- */
/* event_log                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_1')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_2')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_3')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_4')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_5')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_5;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='event_log_FK_6')
    ALTER TABLE event_log DROP CONSTRAINT event_log_FK_6;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'event_log')
BEGIN
    DROP TABLE event_log
END
;

CREATE TABLE event_log
(
    id INT NOT NULL,
    entity_id INT NULL,
    user_id INT NULL,
    affected_user_id INT NULL,
    table_id INT NULL,
    foreign_id INT NOT NULL,
    create_datetime DATETIME NOT NULL,
    level_field INT NOT NULL,
    module_id INT NOT NULL,
    message_id INT NOT NULL,
    old_num INT NULL,
    old_str VARCHAR (1000) NULL,
    old_date DATETIME NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT event_log_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_el_main ON event_log (module_id, message_id, create_datetime);

/* ---------------------------------------------------------------------- */
/* event_log_message                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'event_log_message')
BEGIN
    DROP TABLE event_log_message
END
;

CREATE TABLE event_log_message
(
    id INT NOT NULL,
    CONSTRAINT event_log_message_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* event_log_module                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'event_log_module')
BEGIN
    DROP TABLE event_log_module
END
;

CREATE TABLE event_log_module
(
    id INT NOT NULL,
    CONSTRAINT event_log_module_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* filter                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='filter_FK_1')
    ALTER TABLE filter DROP CONSTRAINT filter_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'filter')
BEGIN
    DROP TABLE filter
END
;

CREATE TABLE filter
(
    id INT NOT NULL,
    filter_set_id INT NOT NULL,
    type VARCHAR (255) NOT NULL,
    constraint_type VARCHAR (255) NOT NULL,
    field VARCHAR (255) NOT NULL,
    template VARCHAR (255) NOT NULL,
    visible BIT NOT NULL,
    integer_value INT NULL,
    string_value VARCHAR (255) NULL,
    start_date_value DATETIME NULL,
    end_date_value DATETIME NULL,
    boolean_value BIT NULL,
    decimal_value NUMERIC (22,10) NULL,
    decimal_high_value NUMERIC (22,10) NULL,
    version INT NOT NULL,
    CONSTRAINT filter_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* filter_set                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'filter_set')
BEGIN
    DROP TABLE filter_set
END
;

CREATE TABLE filter_set
(
    id INT NOT NULL,
    name VARCHAR (255) NOT NULL,
    user_id INT NOT NULL,
    version INT NOT NULL,
    CONSTRAINT filter_set_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* international_description                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='international_description_FK_1')
    ALTER TABLE international_description DROP CONSTRAINT international_description_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='international_description_FK_2')
    ALTER TABLE international_description DROP CONSTRAINT international_description_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'international_description')
BEGIN
    DROP TABLE international_description
END
;

CREATE TABLE international_description
(
    table_id INT NOT NULL,
    foreign_id INT NOT NULL,
    psudo_column VARCHAR (20) NOT NULL,
    language_id INT NOT NULL,
    content VARCHAR (4000) NOT NULL,
    CONSTRAINT international_description_PK PRIMARY KEY(table_id,foreign_id,psudo_column,language_id)
);

CREATE  INDEX international_description_i_2 ON international_description (table_id, foreign_id, language_id);
CREATE  INDEX int_description_i_lan ON international_description (language_id);

/* ---------------------------------------------------------------------- */
/* invoice                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_FK_1')
    ALTER TABLE invoice DROP CONSTRAINT invoice_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_FK_2')
    ALTER TABLE invoice DROP CONSTRAINT invoice_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_FK_3')
    ALTER TABLE invoice DROP CONSTRAINT invoice_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_FK_4')
    ALTER TABLE invoice DROP CONSTRAINT invoice_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_FK_5')
    ALTER TABLE invoice DROP CONSTRAINT invoice_FK_5;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'invoice')
BEGIN
    DROP TABLE invoice
END
;

CREATE TABLE invoice
(
    id INT NOT NULL,
    create_datetime DATETIME NOT NULL,
    billing_process_id INT NULL,
    user_id INT NULL,
    status_id INT NOT NULL,
    delegated_invoice_id INT NULL,
    due_date DATETIME NOT NULL,
    total NUMERIC (22,10) NOT NULL,
    payment_attempts INT default 0 NOT NULL,
    balance NUMERIC (22,10) NULL,
    carried_balance NUMERIC (22,10) NOT NULL,
    in_process_payment SMALLINT default 1 NOT NULL,
    is_review INT NOT NULL,
    currency_id INT NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    paper_invoice_batch_id INT NULL,
    customer_notes VARCHAR (1000) NULL,
    public_number VARCHAR (40) NULL,
    last_reminder DATETIME NULL,
    overdue_step INT NULL,
    create_timestamp DATETIME NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT invoice_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_invoice_user_id ON invoice (user_id, deleted);
CREATE  INDEX ix_invoice_date ON invoice (create_datetime);
CREATE  INDEX ix_invoice_number ON invoice (user_id, public_number);
CREATE  INDEX ix_invoice_due_date ON invoice (user_id, due_date);
CREATE  INDEX ix_invoice_ts ON invoice (create_timestamp, user_id);
CREATE  INDEX ix_invoice_process ON invoice (billing_process_id);

/* ---------------------------------------------------------------------- */
/* invoice_delivery_method                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'invoice_delivery_method')
BEGIN
    DROP TABLE invoice_delivery_method
END
;

CREATE TABLE invoice_delivery_method
(
    id INT NOT NULL,
    CONSTRAINT invoice_delivery_method_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* invoice_line                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_line_FK_1')
    ALTER TABLE invoice_line DROP CONSTRAINT invoice_line_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_line_FK_2')
    ALTER TABLE invoice_line DROP CONSTRAINT invoice_line_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='invoice_line_FK_3')
    ALTER TABLE invoice_line DROP CONSTRAINT invoice_line_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'invoice_line')
BEGIN
    DROP TABLE invoice_line
END
;

CREATE TABLE invoice_line
(
    id INT NOT NULL,
    invoice_id INT NULL,
    type_id INT NULL,
    amount NUMERIC (22,10) NOT NULL,
    quantity NUMERIC (22,10) NULL,
    price NUMERIC (22,10) NULL,
    deleted SMALLINT default 0 NOT NULL,
    item_id INT NULL,
    description VARCHAR (1000) NULL,
    source_user_id INT NULL,
    is_percentage SMALLINT default 0 NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT invoice_line_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_invoice_line_invoice_id ON invoice_line (invoice_id);

/* ---------------------------------------------------------------------- */
/* invoice_line_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'invoice_line_type')
BEGIN
    DROP TABLE invoice_line_type
END
;

CREATE TABLE invoice_line_type
(
    id INT NOT NULL,
    description VARCHAR (50) NOT NULL,
    order_position INT NOT NULL,
    CONSTRAINT invoice_line_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* item                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_FK_1')
    ALTER TABLE item DROP CONSTRAINT item_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'item')
BEGIN
    DROP TABLE item
END
;

CREATE TABLE item
(
    id INT NOT NULL,
    internal_number VARCHAR (50) NULL,
    entity_id INT NULL,
    percentage NUMERIC (22,10) NULL,
    price_manual SMALLINT NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    has_decimals SMALLINT default 0 NOT NULL,
    gl_code VARCHAR (50) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT item_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_item_ent ON item (entity_id, internal_number);

/* ---------------------------------------------------------------------- */
/* item_price                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_price_FK_1')
    ALTER TABLE item_price DROP CONSTRAINT item_price_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_price_FK_2')
    ALTER TABLE item_price DROP CONSTRAINT item_price_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'item_price')
BEGIN
    DROP TABLE item_price
END
;

CREATE TABLE item_price
(
    id INT NOT NULL,
    item_id INT NULL,
    currency_id INT NULL,
    price FLOAT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT item_price_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* item_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_type_FK_1')
    ALTER TABLE item_type DROP CONSTRAINT item_type_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'item_type')
BEGIN
    DROP TABLE item_type
END
;

CREATE TABLE item_type
(
    id INT NOT NULL,
    entity_id INT NOT NULL,
    description VARCHAR (100) NULL,
    order_line_type_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT item_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* item_type_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_type_map_FK_1')
    ALTER TABLE item_type_map DROP CONSTRAINT item_type_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_type_map_FK_2')
    ALTER TABLE item_type_map DROP CONSTRAINT item_type_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'item_type_map')
BEGIN
    DROP TABLE item_type_map
END
;

CREATE TABLE item_type_map
(
    item_id INT NULL,
    type_id INT NULL,
);


/* ---------------------------------------------------------------------- */
/* item_type_exclude_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_type_exclude_map_FK_1')
    ALTER TABLE item_type_exclude_map DROP CONSTRAINT item_type_exclude_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='item_type_exclude_map_FK_2')
    ALTER TABLE item_type_exclude_map DROP CONSTRAINT item_type_exclude_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'item_type_exclude_map')
BEGIN
    DROP TABLE item_type_exclude_map
END
;

CREATE TABLE item_type_exclude_map
(
    item_id INT NULL,
    type_id INT NULL,
);


/* ---------------------------------------------------------------------- */
/* jbilling_table                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'jbilling_table')
BEGIN
    DROP TABLE jbilling_table
END
;

CREATE TABLE jbilling_table
(
    id INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    CONSTRAINT jbilling_table_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* jbilling_seqs                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'jbilling_seqs')
BEGIN
    DROP TABLE jbilling_seqs
END
;

CREATE TABLE jbilling_seqs
(
    name VARCHAR (50) NOT NULL,
    next_id INT default 0 NOT NULL,
);


/* ---------------------------------------------------------------------- */
/* language                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'language')
BEGIN
    DROP TABLE language
END
;

CREATE TABLE language
(
    id INT NOT NULL,
    code VARCHAR (2) NOT NULL,
    description VARCHAR (50) NOT NULL,
    CONSTRAINT language_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_FK_1')
    ALTER TABLE notification_message DROP CONSTRAINT notification_message_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_FK_2')
    ALTER TABLE notification_message DROP CONSTRAINT notification_message_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_FK_3')
    ALTER TABLE notification_message DROP CONSTRAINT notification_message_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message')
BEGIN
    DROP TABLE notification_message
END
;

CREATE TABLE notification_message
(
    id INT NOT NULL,
    type_id INT NULL,
    entity_id INT NOT NULL,
    language_id INT NOT NULL,
    use_flag SMALLINT default 1 NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message_arch                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message_arch')
BEGIN
    DROP TABLE notification_message_arch
END
;

CREATE TABLE notification_message_arch
(
    id INT NOT NULL,
    type_id INT NULL,
    create_datetime DATETIME NOT NULL,
    user_id INT NULL,
    result_message VARCHAR (200) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_arch_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message_arch_line                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notif_mess_arch_line_FK_1')
    ALTER TABLE notification_message_arch_line DROP CONSTRAINT notif_mess_arch_line_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message_arch_line')
BEGIN
    DROP TABLE notification_message_arch_line
END
;

CREATE TABLE notification_message_arch_line
(
    id INT NOT NULL,
    message_archive_id INT NULL,
    section INT NOT NULL,
    content VARCHAR (1000) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_arch_line_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message_line                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_line_FK_1')
    ALTER TABLE notification_message_line DROP CONSTRAINT notification_message_line_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message_line')
BEGIN
    DROP TABLE notification_message_line
END
;

CREATE TABLE notification_message_line
(
    id INT NOT NULL,
    message_section_id INT NULL,
    content VARCHAR (1000) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_line_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message_section                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_sect_FK_1')
    ALTER TABLE notification_message_section DROP CONSTRAINT notification_message_sect_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message_section')
BEGIN
    DROP TABLE notification_message_section
END
;

CREATE TABLE notification_message_section
(
    id INT NOT NULL,
    message_id INT NULL,
    section INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_section_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_message_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='notification_message_type_FK_1')
    ALTER TABLE notification_message_type DROP CONSTRAINT notification_message_type_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_message_type')
BEGIN
    DROP TABLE notification_message_type
END
;

CREATE TABLE notification_message_type
(
    id INT NOT NULL,
    category_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT notification_message_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* notification_category                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'notification_category')
BEGIN
    DROP TABLE notification_category
END
;

CREATE TABLE notification_category
(
    id INT NOT NULL,
    CONSTRAINT notification_category_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* order_billing_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'order_billing_type')
BEGIN
    DROP TABLE order_billing_type
END
;

CREATE TABLE order_billing_type
(
    id INT NOT NULL,
    CONSTRAINT order_billing_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* order_line                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_line_FK_1')
    ALTER TABLE order_line DROP CONSTRAINT order_line_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_line_FK_2')
    ALTER TABLE order_line DROP CONSTRAINT order_line_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_line_FK_3')
    ALTER TABLE order_line DROP CONSTRAINT order_line_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'order_line')
BEGIN
    DROP TABLE order_line
END
;

CREATE TABLE order_line
(
    id INT NOT NULL,
    order_id INT NULL,
    item_id INT NULL,
    type_id INT NULL,
    amount NUMERIC (22,10) NOT NULL,
    quantity NUMERIC (22,10) NULL,
    price NUMERIC (22,10) NULL,
    item_price SMALLINT NULL,
    create_datetime DATETIME NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    use_item BIT NOT NULL,
    description VARCHAR (1000) NULL,
    provisioning_status INT NULL,
    provisioning_request_id VARCHAR (50) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT order_line_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_order_line_order_id ON order_line (order_id);
CREATE  INDEX ix_order_line_item_id ON order_line (item_id);

/* ---------------------------------------------------------------------- */
/* order_line_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'order_line_type')
BEGIN
    DROP TABLE order_line_type
END
;

CREATE TABLE order_line_type
(
    id INT NOT NULL,
    editable SMALLINT NOT NULL,
    CONSTRAINT order_line_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* order_period                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_period_FK_1')
    ALTER TABLE order_period DROP CONSTRAINT order_period_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_period_FK_2')
    ALTER TABLE order_period DROP CONSTRAINT order_period_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'order_period')
BEGIN
    DROP TABLE order_period
END
;

CREATE TABLE order_period
(
    id INT NOT NULL,
    entity_id INT NULL,
    value INT NULL,
    unit_id INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT order_period_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* order_process                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='order_process_FK_1')
    ALTER TABLE order_process DROP CONSTRAINT order_process_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'order_process')
BEGIN
    DROP TABLE order_process
END
;

CREATE TABLE order_process
(
    id INT NOT NULL,
    order_id INT NULL,
    invoice_id INT NULL,
    billing_process_id INT NULL,
    periods_included INT NULL,
    period_start DATETIME NULL,
    period_end DATETIME NULL,
    is_review INT NOT NULL,
    origin INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT order_process_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_uq_order_process_or_in ON order_process (order_id, invoice_id);
CREATE  INDEX ix_uq_order_process_or_bp ON order_process (order_id, billing_process_id);
CREATE  INDEX ix_order_process_in ON order_process (invoice_id);

/* ---------------------------------------------------------------------- */
/* paper_invoice_batch                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'paper_invoice_batch')
BEGIN
    DROP TABLE paper_invoice_batch
END
;

CREATE TABLE paper_invoice_batch
(
    id INT NOT NULL,
    total_invoices INT NOT NULL,
    delivery_date DATETIME NULL,
    is_self_managed SMALLINT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT paper_invoice_batch_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* partner                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='partner_FK_1')
    ALTER TABLE partner DROP CONSTRAINT partner_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='partner_FK_2')
    ALTER TABLE partner DROP CONSTRAINT partner_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='partner_FK_3')
    ALTER TABLE partner DROP CONSTRAINT partner_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='partner_FK_4')
    ALTER TABLE partner DROP CONSTRAINT partner_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'partner')
BEGIN
    DROP TABLE partner
END
;

CREATE TABLE partner
(
    id INT NOT NULL,
    user_id INT NULL,
    balance NUMERIC (22,10) NOT NULL,
    total_payments NUMERIC (22,10) NOT NULL,
    total_refunds NUMERIC (22,10) NOT NULL,
    total_payouts NUMERIC (22,10) NOT NULL,
    percentage_rate NUMERIC (22,10) NULL,
    referral_fee NUMERIC (22,10) NULL,
    fee_currency_id INT NULL,
    one_time SMALLINT NOT NULL,
    period_unit_id INT NOT NULL,
    period_value INT NOT NULL,
    next_payout_date DATETIME NOT NULL,
    due_payout NUMERIC (22,10) NULL,
    automatic_process SMALLINT NOT NULL,
    related_clerk INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT partner_PK PRIMARY KEY(id)
);

CREATE  INDEX partner_i_3 ON partner (user_id);

/* ---------------------------------------------------------------------- */
/* partner_payout                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='partner_payout_FK_1')
    ALTER TABLE partner_payout DROP CONSTRAINT partner_payout_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'partner_payout')
BEGIN
    DROP TABLE partner_payout
END
;

CREATE TABLE partner_payout
(
    id INT NOT NULL,
    starting_date DATETIME NOT NULL,
    ending_date DATETIME NOT NULL,
    payments_amount NUMERIC (22,10) NOT NULL,
    refunds_amount NUMERIC (22,10) NOT NULL,
    balance_left NUMERIC (22,10) NOT NULL,
    payment_id INT NULL,
    partner_id INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT partner_payout_PK PRIMARY KEY(id)
);

CREATE  INDEX partner_payout_i_2 ON partner_payout (partner_id);

/* ---------------------------------------------------------------------- */
/* partner_range                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'partner_range')
BEGIN
    DROP TABLE partner_range
END
;

CREATE TABLE partner_range
(
    id INT NOT NULL,
    partner_id INT NULL,
    percentage_rate NUMERIC (22,10) NULL,
    referral_fee NUMERIC (22,10) NULL,
    range_from INT NOT NULL,
    range_to INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT partner_range_PK PRIMARY KEY(id)
);

CREATE  INDEX partner_range_p ON partner_range (partner_id);

/* ---------------------------------------------------------------------- */
/* payment                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_1')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_2')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_3')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_4')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_5')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_5;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_FK_6')
    ALTER TABLE payment DROP CONSTRAINT payment_FK_6;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment')
BEGIN
    DROP TABLE payment
END
;

CREATE TABLE payment
(
    id INT NOT NULL,
    user_id INT NULL,
    attempt INT NULL,
    result_id INT NULL,
    amount NUMERIC (22,10) NOT NULL,
    create_datetime DATETIME NOT NULL,
    update_datetime DATETIME NULL,
    payment_date DATETIME NULL,
    method_id INT NOT NULL,
    credit_card_id INT NULL,
    deleted SMALLINT default 0 NOT NULL,
    is_refund SMALLINT default 0 NOT NULL,
    is_preauth SMALLINT default 0 NOT NULL,
    payment_id INT NULL,
    currency_id INT NOT NULL,
    payout_id INT NULL,
    ach_id INT NULL,
    balance NUMERIC (22,10) NULL,
    payment_period INT NULL,
    payment_notes VARCHAR (500) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT payment_PK PRIMARY KEY(id)
);

CREATE  INDEX payment_i_2 ON payment (user_id, create_datetime);
CREATE  INDEX payment_i_3 ON payment (user_id, balance);

/* ---------------------------------------------------------------------- */
/* payment_authorization                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_authorization_FK_1')
    ALTER TABLE payment_authorization DROP CONSTRAINT payment_authorization_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment_authorization')
BEGIN
    DROP TABLE payment_authorization
END
;

CREATE TABLE payment_authorization
(
    id INT NOT NULL,
    payment_id INT NULL,
    processor VARCHAR (40) NOT NULL,
    code1 VARCHAR (40) NOT NULL,
    code2 VARCHAR (40) NULL,
    code3 VARCHAR (40) NULL,
    approval_code VARCHAR (20) NULL,
    avs VARCHAR (20) NULL,
    transaction_id VARCHAR (40) NULL,
    md5 VARCHAR (100) NULL,
    card_code VARCHAR (100) NULL,
    create_datetime DATETIME NOT NULL,
    response_message VARCHAR (200) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT payment_authorization_PK PRIMARY KEY(id)
);

CREATE  INDEX create_datetime ON payment_authorization (create_datetime);
CREATE  INDEX transaction_id ON payment_authorization (transaction_id);
CREATE  INDEX ix_pa_payment ON payment_authorization (payment_id);

/* ---------------------------------------------------------------------- */
/* payment_info_cheque                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_info_cheque_FK_1')
    ALTER TABLE payment_info_cheque DROP CONSTRAINT payment_info_cheque_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment_info_cheque')
BEGIN
    DROP TABLE payment_info_cheque
END
;

CREATE TABLE payment_info_cheque
(
    id INT NOT NULL,
    payment_id INT NULL,
    bank VARCHAR (50) NULL,
    cheque_number VARCHAR (50) NULL,
    cheque_date DATETIME NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT payment_info_cheque_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* payment_invoice                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_invoice_FK_1')
    ALTER TABLE payment_invoice DROP CONSTRAINT payment_invoice_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='payment_invoice_FK_2')
    ALTER TABLE payment_invoice DROP CONSTRAINT payment_invoice_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment_invoice')
BEGIN
    DROP TABLE payment_invoice
END
;

CREATE TABLE payment_invoice
(
    id INT NOT NULL,
    payment_id INT NULL,
    invoice_id INT NULL,
    amount NUMERIC (22,10) NULL,
    create_datetime DATETIME NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT payment_invoice_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_uq_payment_inv_map_pa_in ON payment_invoice (payment_id, invoice_id);

/* ---------------------------------------------------------------------- */
/* payment_method                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment_method')
BEGIN
    DROP TABLE payment_method
END
;

CREATE TABLE payment_method
(
    id INT NOT NULL,
    CONSTRAINT payment_method_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* payment_result                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'payment_result')
BEGIN
    DROP TABLE payment_result
END
;

CREATE TABLE payment_result
(
    id INT NOT NULL,
    CONSTRAINT payment_result_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* period_unit                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'period_unit')
BEGIN
    DROP TABLE period_unit
END
;

CREATE TABLE period_unit
(
    id INT NOT NULL,
    CONSTRAINT period_unit_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* permission                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='permission_FK_1')
    ALTER TABLE permission DROP CONSTRAINT permission_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'permission')
BEGIN
    DROP TABLE permission
END
;

CREATE TABLE permission
(
    id INT NOT NULL,
    type_id INT NOT NULL,
    foreign_id INT NULL,
    CONSTRAINT permission_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* permission_role_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='permission_role_map_FK_1')
    ALTER TABLE permission_role_map DROP CONSTRAINT permission_role_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='permission_role_map_FK_2')
    ALTER TABLE permission_role_map DROP CONSTRAINT permission_role_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'permission_role_map')
BEGIN
    DROP TABLE permission_role_map
END
;

CREATE TABLE permission_role_map
(
    permission_id INT NULL,
    role_id INT NULL,
);

CREATE  INDEX permission_role_map_i_2 ON permission_role_map (permission_id, role_id);

/* ---------------------------------------------------------------------- */
/* permission_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'permission_type')
BEGIN
    DROP TABLE permission_type
END
;

CREATE TABLE permission_type
(
    id INT NOT NULL,
    description VARCHAR (30) NOT NULL,
    CONSTRAINT permission_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* permission_user                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='permission_user_FK_1')
    ALTER TABLE permission_user DROP CONSTRAINT permission_user_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='permission_user_FK_2')
    ALTER TABLE permission_user DROP CONSTRAINT permission_user_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'permission_user')
BEGIN
    DROP TABLE permission_user
END
;

CREATE TABLE permission_user
(
    permission_id INT NULL,
    user_id INT NULL,
    is_grant SMALLINT NOT NULL,
    id INT NOT NULL,
    CONSTRAINT permission_user_PK PRIMARY KEY(id)
);

CREATE  INDEX permission_user_map_i_2 ON permission_user (permission_id, user_id);

/* ---------------------------------------------------------------------- */
/* pluggable_task                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='pluggable_task_FK_1')
    ALTER TABLE pluggable_task DROP CONSTRAINT pluggable_task_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='pluggable_task_FK_2')
    ALTER TABLE pluggable_task DROP CONSTRAINT pluggable_task_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'pluggable_task')
BEGIN
    DROP TABLE pluggable_task
END
;

CREATE TABLE pluggable_task
(
    id INT NOT NULL,
    entity_id INT NOT NULL,
    type_id INT NULL,
    processing_order INT NOT NULL,
    notes VARCHAR (1000) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT pluggable_task_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* pluggable_task_parameter                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='pluggable_task_parameter_FK_1')
    ALTER TABLE pluggable_task_parameter DROP CONSTRAINT pluggable_task_parameter_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'pluggable_task_parameter')
BEGIN
    DROP TABLE pluggable_task_parameter
END
;

CREATE TABLE pluggable_task_parameter
(
    id INT NOT NULL,
    task_id INT NULL,
    name VARCHAR (50) NOT NULL,
    int_value INT NULL,
    str_value VARCHAR (500) NULL,
    float_value NUMERIC (22,10) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT pluggable_task_parameter_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* pluggable_task_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='pluggable_task_type_FK_1')
    ALTER TABLE pluggable_task_type DROP CONSTRAINT pluggable_task_type_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'pluggable_task_type')
BEGIN
    DROP TABLE pluggable_task_type
END
;

CREATE TABLE pluggable_task_type
(
    id INT NOT NULL,
    category_id INT NOT NULL,
    class_name VARCHAR (200) NOT NULL,
    min_parameters INT NOT NULL,
    CONSTRAINT pluggable_task_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* pluggable_task_type_category                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'pluggable_task_type_category')
BEGIN
    DROP TABLE pluggable_task_type_category
END
;

CREATE TABLE pluggable_task_type_category
(
    id INT NOT NULL,
    interface_name VARCHAR (200) NOT NULL,
    CONSTRAINT pluggable_task_type_category_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* preference                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='preference_FK_1')
    ALTER TABLE preference DROP CONSTRAINT preference_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='preference_FK_2')
    ALTER TABLE preference DROP CONSTRAINT preference_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'preference')
BEGIN
    DROP TABLE preference
END
;

CREATE TABLE preference
(
    id INT NOT NULL,
    type_id INT NULL,
    table_id INT NOT NULL,
    foreign_id INT NOT NULL,
    value VARCHAR (200) NULL,
    CONSTRAINT preference_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* preference_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'preference_type')
BEGIN
    DROP TABLE preference_type
END
;

CREATE TABLE preference_type
(
    id INT NOT NULL,
    def_value VARCHAR (200) NULL,
    CONSTRAINT preference_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* promotion                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='promotion_FK_1')
    ALTER TABLE promotion DROP CONSTRAINT promotion_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'promotion')
BEGIN
    DROP TABLE promotion
END
;

CREATE TABLE promotion
(
    id INT NOT NULL,
    item_id INT NULL,
    code VARCHAR (50) NOT NULL,
    notes VARCHAR (200) NULL,
    once SMALLINT NOT NULL,
    since DATETIME NULL,
    until DATETIME NULL,
    CONSTRAINT promotion_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_promotion_code ON promotion (code);

/* ---------------------------------------------------------------------- */
/* purchase_order                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_1')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_2')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_3')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_3;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_4')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_4;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_5')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_5;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='purchase_order_FK_6')
    ALTER TABLE purchase_order DROP CONSTRAINT purchase_order_FK_6;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'purchase_order')
BEGIN
    DROP TABLE purchase_order
END
;

CREATE TABLE purchase_order
(
    id INT NOT NULL,
    user_id INT NULL,
    period_id INT NULL,
    billing_type_id INT NOT NULL,
    active_since DATETIME NULL,
    active_until DATETIME NULL,
    cycle_start DATETIME NULL,
    create_datetime DATETIME NOT NULL,
    next_billable_day DATETIME NULL,
    created_by INT NULL,
    status_id INT NOT NULL,
    currency_id INT NOT NULL,
    deleted SMALLINT default 0 NOT NULL,
    notify SMALLINT NULL,
    last_notified DATETIME NULL,
    notification_step INT NULL,
    due_date_unit_id INT NULL,
    due_date_value INT NULL,
    df_fm SMALLINT NULL,
    anticipate_periods INT NULL,
    own_invoice SMALLINT NULL,
    notes VARCHAR (200) NULL,
    notes_in_invoice SMALLINT NULL,
    is_current SMALLINT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT purchase_order_PK PRIMARY KEY(id)
);

CREATE  INDEX purchase_order_i_user ON purchase_order (user_id, deleted);
CREATE  INDEX purchase_order_i_notif ON purchase_order (active_until, notification_step);
CREATE  INDEX ix_purchase_order_date ON purchase_order (user_id, create_datetime);

/* ---------------------------------------------------------------------- */
/* recent_item                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'recent_item')
BEGIN
    DROP TABLE recent_item
END
;

CREATE TABLE recent_item
(
    id INT NOT NULL,
    type VARCHAR (255) NOT NULL,
    object_id INT NOT NULL,
    user_id INT NOT NULL,
    version INT NOT NULL,
    CONSTRAINT recent_item_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* report                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='report_FK_1')
    ALTER TABLE report DROP CONSTRAINT report_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'report')
BEGIN
    DROP TABLE report
END
;

CREATE TABLE report
(
    id INT NOT NULL,
    type_id INT NOT NULL,
    name VARCHAR (255) NOT NULL,
    file_name VARCHAR (255) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT report_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* report_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'report_type')
BEGIN
    DROP TABLE report_type
END
;

CREATE TABLE report_type
(
    id INT NOT NULL,
    name VARCHAR (255) NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT report_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* report_parameter                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='report_parameter_FK_1')
    ALTER TABLE report_parameter DROP CONSTRAINT report_parameter_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'report_parameter')
BEGIN
    DROP TABLE report_parameter
END
;

CREATE TABLE report_parameter
(
    id INT NOT NULL,
    report_id INT NOT NULL,
    dtype VARCHAR (10) NOT NULL,
    name VARCHAR (255) NOT NULL,
    CONSTRAINT report_parameter_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* entity_report_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_report_map_FK_1')
    ALTER TABLE entity_report_map DROP CONSTRAINT entity_report_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='entity_report_map_FK_2')
    ALTER TABLE entity_report_map DROP CONSTRAINT entity_report_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'entity_report_map')
BEGIN
    DROP TABLE entity_report_map
END
;

CREATE TABLE entity_report_map
(
    report_id INT NOT NULL,
    entity_id INT NOT NULL,
    CONSTRAINT entity_report_map_PK PRIMARY KEY(report_id,entity_id)
);


/* ---------------------------------------------------------------------- */
/* role                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'role')
BEGIN
    DROP TABLE role
END
;

CREATE TABLE role
(
    id INT NOT NULL,
    CONSTRAINT role_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* user_credit_card_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'user_credit_card_map')
BEGIN
    DROP TABLE user_credit_card_map
END
;

CREATE TABLE user_credit_card_map
(
    user_id INT NULL,
    credit_card_id INT NULL,
);

CREATE  INDEX user_credit_card_map_i_2 ON user_credit_card_map (user_id, credit_card_id);

/* ---------------------------------------------------------------------- */
/* user_role_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='user_role_map_FK_1')
    ALTER TABLE user_role_map DROP CONSTRAINT user_role_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='user_role_map_FK_2')
    ALTER TABLE user_role_map DROP CONSTRAINT user_role_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'user_role_map')
BEGIN
    DROP TABLE user_role_map
END
;

CREATE TABLE user_role_map
(
    user_id INT NULL,
    role_id INT NULL,
);

CREATE  INDEX user_role_map_i_2 ON user_role_map (user_id, role_id);
CREATE  INDEX user_role_map_i_role ON user_role_map (role_id);

/* ---------------------------------------------------------------------- */
/* mediation_cfg                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_cfg_FK_1')
    ALTER TABLE mediation_cfg DROP CONSTRAINT mediation_cfg_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'mediation_cfg')
BEGIN
    DROP TABLE mediation_cfg
END
;

CREATE TABLE mediation_cfg
(
    id INT NOT NULL,
    entity_id INT NOT NULL,
    create_datetime DATETIME NOT NULL,
    name VARCHAR (50) NOT NULL,
    order_value INT NOT NULL,
    pluggable_task_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT mediation_cfg_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* mediation_process                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_process_FK_1')
    ALTER TABLE mediation_process DROP CONSTRAINT mediation_process_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'mediation_process')
BEGIN
    DROP TABLE mediation_process
END
;

CREATE TABLE mediation_process
(
    id INT NOT NULL,
    configuration_id INT NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NULL,
    orders_affected INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT mediation_process_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* mediation_order_map                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_order_map_FK_1')
    ALTER TABLE mediation_order_map DROP CONSTRAINT mediation_order_map_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_order_map_FK_2')
    ALTER TABLE mediation_order_map DROP CONSTRAINT mediation_order_map_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'mediation_order_map')
BEGIN
    DROP TABLE mediation_order_map
END
;

CREATE TABLE mediation_order_map
(
    mediation_process_id INT NOT NULL,
    order_id INT NOT NULL,
);


/* ---------------------------------------------------------------------- */
/* mediation_record                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_record_FK_1')
    ALTER TABLE mediation_record DROP CONSTRAINT mediation_record_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_record_FK_2')
    ALTER TABLE mediation_record DROP CONSTRAINT mediation_record_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'mediation_record')
BEGIN
    DROP TABLE mediation_record
END
;

CREATE TABLE mediation_record
(
    id INT NOT NULL,
    id_key VARCHAR (100) NOT NULL,
    start_datetime DATETIME NOT NULL,
    mediation_process_id INT NULL,
    status_id INT NOT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT mediation_record_PK PRIMARY KEY(id)
);

CREATE  INDEX mediation_record_i ON mediation_record (id, status_id);

/* ---------------------------------------------------------------------- */
/* mediation_record_line                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_record_line_FK_1')
    ALTER TABLE mediation_record_line DROP CONSTRAINT mediation_record_line_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='mediation_record_line_FK_2')
    ALTER TABLE mediation_record_line DROP CONSTRAINT mediation_record_line_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'mediation_record_line')
BEGIN
    DROP TABLE mediation_record_line
END
;

CREATE TABLE mediation_record_line
(
    id INT NOT NULL,
    mediation_record_id INT NOT NULL,
    order_line_id INT NOT NULL,
    event_date DATETIME NOT NULL,
    amount NUMERIC (22,10) NOT NULL,
    quantity NUMERIC (22,10) NOT NULL,
    description VARCHAR (200) NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT mediation_record_line_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_mrl_order_line ON mediation_record_line (order_line_id);

/* ---------------------------------------------------------------------- */
/* blacklist                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='blacklist_FK_1')
    ALTER TABLE blacklist DROP CONSTRAINT blacklist_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='blacklist_FK_2')
    ALTER TABLE blacklist DROP CONSTRAINT blacklist_FK_2;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'blacklist')
BEGIN
    DROP TABLE blacklist
END
;

CREATE TABLE blacklist
(
    id INT NOT NULL,
    entity_id INT NOT NULL,
    create_datetime DATETIME NOT NULL,
    type INT NOT NULL,
    source INT NOT NULL,
    credit_card INT NULL,
    credit_card_id INT NULL,
    contact_id INT NULL,
    user_id INT NULL,
    OPTLOCK INT NOT NULL,
    CONSTRAINT blacklist_PK PRIMARY KEY(id)
);

CREATE  INDEX ix_blacklist_user_type ON blacklist (user_id, type);
CREATE  INDEX ix_blacklist_entity_type ON blacklist (entity_id, type);

/* ---------------------------------------------------------------------- */
/* generic_status_type                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'generic_status_type')
BEGIN
    DROP TABLE generic_status_type
END
;

CREATE TABLE generic_status_type
(
    id VARCHAR (40) NOT NULL,
    CONSTRAINT generic_status_type_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* generic_status                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type ='RI' AND name='generic_status_FK_1')
    ALTER TABLE generic_status DROP CONSTRAINT generic_status_FK_1;
IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'generic_status')
BEGIN
    DROP TABLE generic_status
END
;

CREATE TABLE generic_status
(
    id INT NOT NULL,
    dtype VARCHAR (40) NOT NULL,
    status_value INT NOT NULL,
    can_login SMALLINT NULL,
    CONSTRAINT generic_status_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* shortcut                                                      */
/* ---------------------------------------------------------------------- */

IF EXISTS (SELECT 1 FROM sysobjects WHERE type = 'U' AND name = 'shortcut')
BEGIN
    DROP TABLE shortcut
END
;

CREATE TABLE shortcut
(
    id INT NOT NULL,
    user_id INT NOT NULL,
    controller VARCHAR (255) NOT NULL,
    action VARCHAR (255) NULL,
    name VARCHAR (255) NULL,
    object_id INT NULL,
    version INT NOT NULL,
    CONSTRAINT shortcut_PK PRIMARY KEY(id)
);


/* ---------------------------------------------------------------------- */
/* shortcut                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE ach
    ADD CONSTRAINT ach_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;



/* ---------------------------------------------------------------------- */
/* ach                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE ageing_entity_step
    ADD CONSTRAINT ageing_entity_step_FK_1 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;

BEGIN
ALTER TABLE ageing_entity_step
    ADD CONSTRAINT ageing_entity_step_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* ageing_entity_step                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_1 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;

BEGIN
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_2 FOREIGN KEY (subscriber_status)
    REFERENCES generic_status (id)
END
;

BEGIN
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_3 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_4 FOREIGN KEY (language_id)
    REFERENCES language (id)
END
;

BEGIN
ALTER TABLE base_user
    ADD CONSTRAINT base_user_FK_5 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;



/* ---------------------------------------------------------------------- */
/* base_user                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
END
;

BEGIN
ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE billing_process
    ADD CONSTRAINT billing_process_FK_3 FOREIGN KEY (paper_invoice_batch_id)
    REFERENCES paper_invoice_batch (id)
END
;



/* ---------------------------------------------------------------------- */
/* billing_process                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE billing_process_configuration
    ADD CONSTRAINT billing_process_configura_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
END
;

BEGIN
ALTER TABLE billing_process_configuration
    ADD CONSTRAINT billing_process_configura_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* billing_process_configuration                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* breadcrumb                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE process_run
    ADD CONSTRAINT process_run_FK_1 FOREIGN KEY (process_id)
    REFERENCES billing_process (id)
END
;

BEGIN
ALTER TABLE process_run
    ADD CONSTRAINT process_run_FK_2 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;



/* ---------------------------------------------------------------------- */
/* process_run                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE process_run_total
    ADD CONSTRAINT process_run_total_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE process_run_total
    ADD CONSTRAINT process_run_total_FK_2 FOREIGN KEY (process_run_id)
    REFERENCES process_run (id)
END
;



/* ---------------------------------------------------------------------- */
/* process_run_total                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE process_run_total_pm
    ADD CONSTRAINT process_run_total_pm_FK_1 FOREIGN KEY (payment_method_id)
    REFERENCES payment_method (id)
END
;



/* ---------------------------------------------------------------------- */
/* process_run_total_pm                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE process_run_user
    ADD CONSTRAINT process_run_user_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE process_run_user
    ADD CONSTRAINT process_run_user_FK_2 FOREIGN KEY (process_run_id)
    REFERENCES process_run (id)
END
;



/* ---------------------------------------------------------------------- */
/* process_run_user                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* contact                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE contact_field
    ADD CONSTRAINT contact_field_FK_1 FOREIGN KEY (contact_id)
    REFERENCES contact (id)
END
;

BEGIN
ALTER TABLE contact_field
    ADD CONSTRAINT contact_field_FK_2 FOREIGN KEY (type_id)
    REFERENCES contact_field_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* contact_field                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE contact_field_type
    ADD CONSTRAINT contact_field_type_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* contact_field_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_1 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
END
;

BEGIN
ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES contact_type (id)
END
;

BEGIN
ALTER TABLE contact_map
    ADD CONSTRAINT contact_map_FK_3 FOREIGN KEY (contact_id)
    REFERENCES contact (id)
END
;



/* ---------------------------------------------------------------------- */
/* contact_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE contact_type
    ADD CONSTRAINT contact_type_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* contact_type                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* country                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* credit_card                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* currency                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE currency_entity_map
    ADD CONSTRAINT currency_entity_map_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE currency_entity_map
    ADD CONSTRAINT currency_entity_map_FK_2 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;



/* ---------------------------------------------------------------------- */
/* currency_entity_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE currency_exchange
    ADD CONSTRAINT currency_exchange_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;



/* ---------------------------------------------------------------------- */
/* currency_exchange                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE customer
    ADD CONSTRAINT customer_FK_1 FOREIGN KEY (invoice_delivery_method_id)
    REFERENCES invoice_delivery_method (id)
END
;

BEGIN
ALTER TABLE customer
    ADD CONSTRAINT customer_FK_2 FOREIGN KEY (partner_id)
    REFERENCES partner (id)
END
;

BEGIN
ALTER TABLE customer
    ADD CONSTRAINT customer_FK_3 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;



/* ---------------------------------------------------------------------- */
/* customer                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE entity
    ADD CONSTRAINT entity_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE entity
    ADD CONSTRAINT entity_FK_2 FOREIGN KEY (language_id)
    REFERENCES language (id)
END
;



/* ---------------------------------------------------------------------- */
/* entity                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE entity_delivery_method_map
    ADD CONSTRAINT entity_delivery_method_ma_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE entity_delivery_method_map
    ADD CONSTRAINT entity_delivery_method_ma_FK_2 FOREIGN KEY (method_id)
    REFERENCES invoice_delivery_method (id)
END
;



/* ---------------------------------------------------------------------- */
/* entity_delivery_method_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE entity_payment_method_map
    ADD CONSTRAINT entity_payment_method_map_FK_1 FOREIGN KEY (payment_method_id)
    REFERENCES payment_method (id)
END
;

BEGIN
ALTER TABLE entity_payment_method_map
    ADD CONSTRAINT entity_payment_method_map_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* entity_payment_method_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_1 FOREIGN KEY (module_id)
    REFERENCES event_log_module (id)
END
;

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_3 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_4 FOREIGN KEY (affected_user_id)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_5 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
END
;

BEGIN
ALTER TABLE event_log
    ADD CONSTRAINT event_log_FK_6 FOREIGN KEY (message_id)
    REFERENCES event_log_message (id)
END
;



/* ---------------------------------------------------------------------- */
/* event_log                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* event_log_message                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* event_log_module                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE filter
    ADD CONSTRAINT filter_FK_1 FOREIGN KEY (filter_set_id)
    REFERENCES filter_set (id)
END
;



/* ---------------------------------------------------------------------- */
/* filter                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* filter_set                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE international_description
    ADD CONSTRAINT international_description_FK_1 FOREIGN KEY (language_id)
    REFERENCES language (id)
END
;

BEGIN
ALTER TABLE international_description
    ADD CONSTRAINT international_description_FK_2 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
END
;



/* ---------------------------------------------------------------------- */
/* international_description                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_1 FOREIGN KEY (billing_process_id)
    REFERENCES billing_process (id)
END
;

BEGIN
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_2 FOREIGN KEY (paper_invoice_batch_id)
    REFERENCES paper_invoice_batch (id)
END
;

BEGIN
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_3 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_4 FOREIGN KEY (delegated_invoice_id)
    REFERENCES invoice (id)
END
;

BEGIN
ALTER TABLE invoice
    ADD CONSTRAINT invoice_FK_5 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;



/* ---------------------------------------------------------------------- */
/* invoice                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* invoice_delivery_method                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_1 FOREIGN KEY (invoice_id)
    REFERENCES invoice (id)
END
;

BEGIN
ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_2 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;

BEGIN
ALTER TABLE invoice_line
    ADD CONSTRAINT invoice_line_FK_3 FOREIGN KEY (type_id)
    REFERENCES invoice_line_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* invoice_line                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* invoice_line_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE item
    ADD CONSTRAINT item_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* item                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE item_price
    ADD CONSTRAINT item_price_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE item_price
    ADD CONSTRAINT item_price_FK_2 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;



/* ---------------------------------------------------------------------- */
/* item_price                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE item_type
    ADD CONSTRAINT item_type_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* item_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE item_type_map
    ADD CONSTRAINT item_type_map_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;

BEGIN
ALTER TABLE item_type_map
    ADD CONSTRAINT item_type_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES item_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* item_type_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE item_type_exclude_map
    ADD CONSTRAINT item_type_exclude_map_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;

BEGIN
ALTER TABLE item_type_exclude_map
    ADD CONSTRAINT item_type_exclude_map_FK_2 FOREIGN KEY (type_id)
    REFERENCES item_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* item_type_exclude_map                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* jbilling_table                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* jbilling_seqs                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* language                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_1 FOREIGN KEY (language_id)
    REFERENCES language (id)
END
;

BEGIN
ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_2 FOREIGN KEY (type_id)
    REFERENCES notification_message_type (id)
END
;

BEGIN
ALTER TABLE notification_message
    ADD CONSTRAINT notification_message_FK_3 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* notification_message                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* notification_message_arch                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE notification_message_arch_line
    ADD CONSTRAINT notif_mess_arch_line_FK_1 FOREIGN KEY (message_archive_id)
    REFERENCES notification_message_arch (id)
END
;



/* ---------------------------------------------------------------------- */
/* notification_message_arch_line                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE notification_message_line
    ADD CONSTRAINT notification_message_line_FK_1 FOREIGN KEY (message_section_id)
    REFERENCES notification_message_section (id)
END
;



/* ---------------------------------------------------------------------- */
/* notification_message_line                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE notification_message_section
    ADD CONSTRAINT notification_message_sect_FK_1 FOREIGN KEY (message_id)
    REFERENCES notification_message (id)
END
;



/* ---------------------------------------------------------------------- */
/* notification_message_section                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE notification_message_type
    ADD CONSTRAINT notification_message_type_FK_1 FOREIGN KEY (category_id)
    REFERENCES notification_category (id)
END
;



/* ---------------------------------------------------------------------- */
/* notification_message_type                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* notification_category                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* order_billing_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;

BEGIN
ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_2 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
END
;

BEGIN
ALTER TABLE order_line
    ADD CONSTRAINT order_line_FK_3 FOREIGN KEY (type_id)
    REFERENCES order_line_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* order_line                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* order_line_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE order_period
    ADD CONSTRAINT order_period_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE order_period
    ADD CONSTRAINT order_period_FK_2 FOREIGN KEY (unit_id)
    REFERENCES period_unit (id)
END
;



/* ---------------------------------------------------------------------- */
/* order_period                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE order_process
    ADD CONSTRAINT order_process_FK_1 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
END
;



/* ---------------------------------------------------------------------- */
/* order_process                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* paper_invoice_batch                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_1 FOREIGN KEY (period_unit_id)
    REFERENCES period_unit (id)
END
;

BEGIN
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_2 FOREIGN KEY (fee_currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_3 FOREIGN KEY (related_clerk)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE partner
    ADD CONSTRAINT partner_FK_4 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;



/* ---------------------------------------------------------------------- */
/* partner                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE partner_payout
    ADD CONSTRAINT partner_payout_FK_1 FOREIGN KEY (partner_id)
    REFERENCES partner (id)
END
;



/* ---------------------------------------------------------------------- */
/* partner_payout                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* partner_range                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_1 FOREIGN KEY (ach_id)
    REFERENCES ach (id)
END
;

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_2 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_3 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
END
;

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_4 FOREIGN KEY (credit_card_id)
    REFERENCES credit_card (id)
END
;

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_5 FOREIGN KEY (result_id)
    REFERENCES payment_result (id)
END
;

BEGIN
ALTER TABLE payment
    ADD CONSTRAINT payment_FK_6 FOREIGN KEY (method_id)
    REFERENCES payment_method (id)
END
;



/* ---------------------------------------------------------------------- */
/* payment                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE payment_authorization
    ADD CONSTRAINT payment_authorization_FK_1 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
END
;



/* ---------------------------------------------------------------------- */
/* payment_authorization                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE payment_info_cheque
    ADD CONSTRAINT payment_info_cheque_FK_1 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
END
;



/* ---------------------------------------------------------------------- */
/* payment_info_cheque                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE payment_invoice
    ADD CONSTRAINT payment_invoice_FK_1 FOREIGN KEY (invoice_id)
    REFERENCES invoice (id)
END
;

BEGIN
ALTER TABLE payment_invoice
    ADD CONSTRAINT payment_invoice_FK_2 FOREIGN KEY (payment_id)
    REFERENCES payment (id)
END
;



/* ---------------------------------------------------------------------- */
/* payment_invoice                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* payment_method                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* payment_result                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* period_unit                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE permission
    ADD CONSTRAINT permission_FK_1 FOREIGN KEY (type_id)
    REFERENCES permission_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* permission                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE permission_role_map
    ADD CONSTRAINT permission_role_map_FK_1 FOREIGN KEY (role_id)
    REFERENCES role (id)
END
;

BEGIN
ALTER TABLE permission_role_map
    ADD CONSTRAINT permission_role_map_FK_2 FOREIGN KEY (permission_id)
    REFERENCES permission (id)
END
;



/* ---------------------------------------------------------------------- */
/* permission_role_map                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* permission_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE permission_user
    ADD CONSTRAINT permission_user_FK_1 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE permission_user
    ADD CONSTRAINT permission_user_FK_2 FOREIGN KEY (permission_id)
    REFERENCES permission (id)
END
;



/* ---------------------------------------------------------------------- */
/* permission_user                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE pluggable_task
    ADD CONSTRAINT pluggable_task_FK_1 FOREIGN KEY (type_id)
    REFERENCES pluggable_task_type (id)
END
;

BEGIN
ALTER TABLE pluggable_task
    ADD CONSTRAINT pluggable_task_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* pluggable_task                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE pluggable_task_parameter
    ADD CONSTRAINT pluggable_task_parameter_FK_1 FOREIGN KEY (task_id)
    REFERENCES pluggable_task (id)
END
;



/* ---------------------------------------------------------------------- */
/* pluggable_task_parameter                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE pluggable_task_type
    ADD CONSTRAINT pluggable_task_type_FK_1 FOREIGN KEY (category_id)
    REFERENCES pluggable_task_type_category (id)
END
;



/* ---------------------------------------------------------------------- */
/* pluggable_task_type                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* pluggable_task_type_category                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE preference
    ADD CONSTRAINT preference_FK_1 FOREIGN KEY (type_id)
    REFERENCES preference_type (id)
END
;

BEGIN
ALTER TABLE preference
    ADD CONSTRAINT preference_FK_2 FOREIGN KEY (table_id)
    REFERENCES jbilling_table (id)
END
;



/* ---------------------------------------------------------------------- */
/* preference                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* preference_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE promotion
    ADD CONSTRAINT promotion_FK_1 FOREIGN KEY (item_id)
    REFERENCES item (id)
END
;



/* ---------------------------------------------------------------------- */
/* promotion                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_1 FOREIGN KEY (currency_id)
    REFERENCES currency (id)
END
;

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_2 FOREIGN KEY (billing_type_id)
    REFERENCES order_billing_type (id)
END
;

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_3 FOREIGN KEY (period_id)
    REFERENCES order_period (id)
END
;

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_4 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_5 FOREIGN KEY (created_by)
    REFERENCES base_user (id)
END
;

BEGIN
ALTER TABLE purchase_order
    ADD CONSTRAINT purchase_order_FK_6 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;



/* ---------------------------------------------------------------------- */
/* purchase_order                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* recent_item                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE report
    ADD CONSTRAINT report_FK_1 FOREIGN KEY (type_id)
    REFERENCES report_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* report                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* report_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE report_parameter
    ADD CONSTRAINT report_parameter_FK_1 FOREIGN KEY (report_id)
    REFERENCES report (id)
END
;



/* ---------------------------------------------------------------------- */
/* report_parameter                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE entity_report_map
    ADD CONSTRAINT entity_report_map_FK_1 FOREIGN KEY (report_id)
    REFERENCES report (id)
END
;

BEGIN
ALTER TABLE entity_report_map
    ADD CONSTRAINT entity_report_map_FK_2 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;



/* ---------------------------------------------------------------------- */
/* entity_report_map                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* role                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* user_credit_card_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE user_role_map
    ADD CONSTRAINT user_role_map_FK_1 FOREIGN KEY (role_id)
    REFERENCES role (id)
END
;

BEGIN
ALTER TABLE user_role_map
    ADD CONSTRAINT user_role_map_FK_2 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;



/* ---------------------------------------------------------------------- */
/* user_role_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE mediation_cfg
    ADD CONSTRAINT mediation_cfg_FK_1 FOREIGN KEY (pluggable_task_id)
    REFERENCES pluggable_task (id)
END
;



/* ---------------------------------------------------------------------- */
/* mediation_cfg                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE mediation_process
    ADD CONSTRAINT mediation_process_FK_1 FOREIGN KEY (configuration_id)
    REFERENCES mediation_cfg (id)
END
;



/* ---------------------------------------------------------------------- */
/* mediation_process                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE mediation_order_map
    ADD CONSTRAINT mediation_order_map_FK_1 FOREIGN KEY (mediation_process_id)
    REFERENCES mediation_process (id)
END
;

BEGIN
ALTER TABLE mediation_order_map
    ADD CONSTRAINT mediation_order_map_FK_2 FOREIGN KEY (order_id)
    REFERENCES purchase_order (id)
END
;



/* ---------------------------------------------------------------------- */
/* mediation_order_map                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE mediation_record
    ADD CONSTRAINT mediation_record_FK_1 FOREIGN KEY (mediation_process_id)
    REFERENCES mediation_process (id)
END
;

BEGIN
ALTER TABLE mediation_record
    ADD CONSTRAINT mediation_record_FK_2 FOREIGN KEY (status_id)
    REFERENCES generic_status (id)
END
;



/* ---------------------------------------------------------------------- */
/* mediation_record                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE mediation_record_line
    ADD CONSTRAINT mediation_record_line_FK_1 FOREIGN KEY (mediation_record_id)
    REFERENCES mediation_record (id)
END
;

BEGIN
ALTER TABLE mediation_record_line
    ADD CONSTRAINT mediation_record_line_FK_2 FOREIGN KEY (order_line_id)
    REFERENCES order_line (id)
END
;



/* ---------------------------------------------------------------------- */
/* mediation_record_line                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE blacklist
    ADD CONSTRAINT blacklist_FK_1 FOREIGN KEY (entity_id)
    REFERENCES entity (id)
END
;

BEGIN
ALTER TABLE blacklist
    ADD CONSTRAINT blacklist_FK_2 FOREIGN KEY (user_id)
    REFERENCES base_user (id)
END
;



/* ---------------------------------------------------------------------- */
/* blacklist                                                      */
/* ---------------------------------------------------------------------- */



/* ---------------------------------------------------------------------- */
/* generic_status_type                                                      */
/* ---------------------------------------------------------------------- */

BEGIN
ALTER TABLE generic_status
    ADD CONSTRAINT generic_status_FK_1 FOREIGN KEY (dtype)
    REFERENCES generic_status_type (id)
END
;



/* ---------------------------------------------------------------------- */
/* generic_status                                                      */
/* ---------------------------------------------------------------------- */


