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
    name varchar(64),
    foreign key (property_id) references PROPERTY(property_id)
);

CREATE TABLE UNIT(
    unit_id int auto_increment not null primary key,
    property_id int,
    floorplan_id int,
    occupied bool,
    leased bool,
    unit_no int,
    lease_info_id int,
    foreign key (property_id) references PROPERTY(property_id),
    foreign key (floorplan_id) references FLOORPLAN(floorplan_id)
);

CREATE TABLE PARKING(
  parking_id int auto_increment not null primary key,
  unit_id int,
  space_no int,
  foreign key (unit_id) references UNIT(unit_id)
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
    term_length int,
    lease_info_id_fk int not null,
    foreign key (lease_info_id_fk) references LEASE_INFO(lease_info_id)
);

CREATE TABLE EMPLOYEE(
    employee_id int auto_increment not null primary key,
    first_name varchar(15),
    last_name varchar(15),
    role varchar(25),
    hire_date date,
    active boolean
);

CREATE TABLE GUEST_CARD(
    guest_card_id int auto_increment not null primary key,
    first_name varchar(15),
    last_name varchar(15),
    age int,
    income int,
    email varchar(128),
    phone_number int,
    number_pets int,
    mailing_address varchar(128),
    applied boolean,
    employee_id_fk int not null,
    foreign key (employee_id_fk) references EMPLOYEE (employee_id)
);

CREATE TABLE APPLICATION(
    application_id int auto_increment not null,
    renter_id int,
    primary key (application_id, renter_id),
    unit_id int,
    employee_id int,
    submit_date date,
    processing_date date,
    foreign key (renter_id) references GUEST_CARD(guest_card_id)
);

CREATE TABLE LEASE_AGREEMENT(
    lease_id int auto_increment not null primary key,
    application_id int,
    unit_id int,
    lease_term_id int,
    start_date date,
    end_date date,
    foreign key (application_id) references APPLICATION(application_id)
);

CREATE TABLE RESIDENT(
    resident_id int auto_increment not null primary key,
    guest_card_id int,
    unit_id int,
    unit_no int,
    foreign key (guest_card_id) references GUEST_CARD(guest_card_id),
    foreign key (unit_id) references UNIT(unit_id)
);

CREATE TABLE WORK_ORDER(
   wo_id int auto_increment not null primary key,
   description varchar(250),
   unit_id int,
   resident_id int,
   priority varchar(8),
   pte boolean,
   foreign key (unit_id) references UNIT(unit_id),
   foreign key (resident_id) references RESIDENT(resident_id)
);

