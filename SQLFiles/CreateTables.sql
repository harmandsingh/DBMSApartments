CREATE TABLE PROPERTY(
    property_id  int auto_increment not null primary key,
    name varchar(64),
    total_units int
);

CREATE TABLE FLOORPLAN(
    floorplan_id int auto_increment not null primary key,
    name varchar(10),
    sqft int,
    bedrooms int,
    bathrooms int
);

CREATE TABLE AMENITY(
    amenity_id int auto_increment not null primary key,
    property_id int,
    name varchar(64)
);

CREATE TABLE PARKING(
  parking_id int auto_increment not null primary key,
  unit_id int,
  space_no int
);

CREATE TABLE UNIT(
    unit_id int auto_increment not null primary key,
    property_id int,
    floorplan_id int,
    occupied bool,
    leased bool,
    unit_no int,
    lease_info_id int

);

CREATE TABLE LEASE_INFO(
    lease_info_id int auto_increment not null primary key,
    security_deposit int,
    rental_rate int,
    lease_break_fee int,
    lease_term int,
    start_date date,
    end_date date
);

CREATE TABLE LEASE_TERM(
    lease_term_id int auto_increment not null,
    unit_id int,
    rental_rate_id int,
    primary key (lease_term_id, unit_id, rental_rate_id),
    term_length int
);

CREATE TABLE APPLICATION(
    application_id int auto_increment not null,
    renter_id int,
    primary key (application_id, renter_id),
    unit_id int,
    employee_id int,
    submit_date date,
    processing_date date
);

CREATE TABLE EMPLOYEE(
    employee_id int auto_increment not null primary key,
    first_name varchar(15),
    last_name varchar(15),
    role varchar(25),
    hire_date date,
    active boolean
);

CREATE TABLE LEASE_AGREEMENT(
    lease_id int auto_increment not null primary key,
    application_id int,
    unit_id int,
    lease_term_id int,
    start_date date,
    end_date date
);

CREATE TABLE RESIDENT(
    resident_id int auto_increment not null primary key,
    guest_card_id int,
    unit_id int
);

CREATE TABLE GUEST_CARD(
    guest_card_id int auto_increment not null primary key,
    first_name varchar(15),
    last_name varchar(15),
    age int,
    income int,
    phone_number int,
    number_pets int,
    mailing_address varchar(128),
    applied boolean
);

CREATE TABLE WORK_ORDER(
   wo_id int auto_increment not null primary key,
   description varchar(250),
   unit_id int,
   resident_id int,
   priority varchar(8),
   pte boolean
);

