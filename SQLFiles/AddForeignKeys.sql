alter table UNIT
    add foreign key (property_id) references PROPERTY(property_id),
    add foreign key (floorplan_id) references FLOORPLAN(floorplan_id)

alter table AMENITY
    add foreign key (property_id) references PROPERTY(property_id)

alter table APPLICATION
    add foreign key (renter_id) references GUEST_CARD(guest_card_id)

alter table LEASE_AGREEMENT
    add foreign key (application_id) references APPLICATION(application_id)

alter table LEASE_TERM
    add foreign key (lease_info_id) references LEASE_INFO(lease_info_id)

alter table PARKING
    add foreign key (unit_id) references UNIT(unit_id)

alter table RESIDENT
    add foreign key (guest_card_id) references GUEST_CARD(guest_card_id)

alter table RESIDENT
    add foreign key (unit_id) references UNIT(unit_id)

alter table WORK_ORDER
    add foreign key (unit_id) references UNIT(unit_id),
    add foreign key (resident_id) references RESIDENT(resident_id)

alter table GUEST_CARD
    add foreign key (employee_id) references EMPLOYEE (employee_id)

