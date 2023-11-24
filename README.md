# DBMS Apartments

## Database Management Systems project for CS157A at SJSU

### Problem Statement:

We are trying to digitize an apartment community’s management system so that they can access all their current, past and prospective resident records using a database. The system will also allow the user to manage applications and work orders.

### Requirements Gathering and Analysis:

The user of our DBMS will be an employee of the apartment community. We assume that the employees entered into the system are done
on the backend. The user would like to be able to create guest cards for prospective residents, assign themselves or another agent to the guest card, search for current
& past residents, and create work orders. They would also like to be able to create applications for prospective residents, and convert them into current residents by
processing the move in once the application has been approved. The user will also need to be able to move current residents out, but maintain them in the system with
their old unit number. The staff will also be able to create work orders and assign them to the resident making the request.

### Normalized Tables in 3NF before implementing the physical design.

### Logical Design: Modify ER Model to determine data types and all attributes for entities. Apply normalization to find any additional entities needed.

PROPERTY: ID(PK), NAME, TOTAL UNITS, FLOORPLANS, AMENITIES, PARKING

This relation has three multivalued attributes (FLOORPLANS, AMENITIES, PARKING) which need to be removed in order to convert this relation to 1NF.

PROPERTY: ID(PK), NAME, TOTAL UNITS

FLOORPLAN: ID(PK), PROPERTY ID(PK), NAME, SQFT, #BEDROOMS, #BATHROOMS

AMENITY: ID(PK), PROPERTY ID(PK), NAME

PARKING: ID(PK), UNIT ID(PK), NUMBER

Since all the non-key attributes are functionally dependent on the entire primary key these relations are in the 2NF. Also, since all the non-key attributes depend
only on the primary key, these relations are in the 3NF.

UNIT: ID(PK), PROPERTY ID, FLOORPLAN ID, AVAILABILITY, RESERVED, LEASE INFO, UNIT NUMBER, UNIT FLOOR, DESCRIPTION

This relation has one multivalued attribute (LEASE INFO) which needs to be removed in order to convert this relation to 1NF.

UNIT: ID(PK), PROPERTY ID, FLOORPLAN ID, AVAILABILITY, RESERVED, UNIT NUMBER, LEASE INFO ID

RENTAL RATES: ID(PK), UNIT ID(PK), 12 MONTH, 11 MONTH, 10 MONTH, 9 MONTH, 8 MONTH, 7 MONTH, 6 MONTH

LEASE INFO: ID(PK), UNIT ID SECURITY DEPOSIT, RENTAL RATE ID, LEASE TERM, LEASE TERMINATION FEE, START DATE, END DATE

Since all the non-key attributes are functionally dependent on the entire primary key these relations are in the 2NF. Since the rental rate depends on the lease term,
this is not in 3NF.

LEASE INFO: ID(PK), UNIT ID, SECURITY DEPOSIT, RENTAL RATE ID, LEASE TERM ID, LEASE TERMINATION FEE, START DATE, END DATE

LEASE TERM: ID(PK), UNIT ID(PK), RENTAL RATE ID(PK), TERM LENGTH

APPLICATION: ID(PK), RENTER FIRST NAME, RENTER LAST NAME, DOCUMENT PROOF ID, PERMANENT ADDRESS, SUBMIT DATE, PROCESSING DATE, PROCESSING STATUS, UNIT ID, LEASING AGENT,
LEASE LENGTH, MONTHLY RENT, LEASE START, LEASE END

This relation has one multivalued attribute (LEASING AGENT) which needs to be removed in order to convert this relation to 1NF. Also, since the LEASING AGENT would be
an employee of the apartment community management, we can make a new relation for EMPLOYEES.

APPLICATION: ID(PK), RENTER ID, RENTER FIRST NAME, RENTER LAST NAME, DOCUMENT PROOF ID, PERMANENT ADDRESS, SUBMIT DATE, PROCESSING DATE, PROCESSING STATUS, UNIT ID,
LEASE LENGTH, MONTHLY RENT, LEASE START, LEASE END, EMPLOYEE ID

EMPLOYEE: ID(PK), FIRST NAME, LAST NAME, ROLE, WORK START, WORK END

Since all the non-key attributes are functionally dependent on the entire primary key these relations are in the 2NF. But, there are some attributes (RENTER FIRST NAME,
RENTER LAST NAME, DOCUMENT PROOF ID, PERMANENT ADDRESS, LEASE LENGTH, MONTHLY RENT, LEASE START, LEASE END) which depend on other non-key attributes. So, we need to
remove them to convert this relation to 3NF.

APPLICATION: ID(PK), RENTER ID, SUBMIT DATE, PROCESSING DATE, UNIT ID, EMPLOYEE ID

EMPLOYEE: ID(PK), FIRST NAME, LAST NAME, ROLE, WORK START, ACTIVE

RENTER: ID(PK), FIRST NAME, LAST NAME, AGE, INCOME, MAILING ADDRESS

LEASE AGREEMENT: ID(PK), APPLICATION ID, UNIT ID, LEASE LENGTH, MONTHLY RENT, LEASE START, LEASE END

We are using the Resident relation to keep track of the residents living in the apartment community to keep track of their names, contact information, pets, and their
lease agreement.

RESIDENT: ID(PK), UNIT ID, FIRST NAME, LAST NAME, PHONE NUMBER, NUMBER OF PETS, LEASE AGREEMENT ID

This relation has no multivalued attributes and thus is already in the 1NF. Since all the non-key attributes are functionally dependent on the entire primary key this
relation is in the 2NF. Also, since all the non-key attributes depend only on the primary key, this relation is in the 3NF.

EMPLOYEE: ID(PK), FIRST NAME, LAST NAME, ROLE, WORK START, WORK END

This relation has no multivalued attributes and thus is already in the 1NF. Since all the non-key attributes are functionally dependent on the entire primary key this
relation is in the 2NF. Also, since all the non-key attributes depend only on the primary key, this relation is in the 3NF.

GUEST CARD: ID(PK), FIRST NAME, LAST NAME, PHONE NUMBER, UNIT ID

This relation has no multivalued attributes and thus is already in the 1NF. Since all the non-key attributes are functionally dependent on the entire primary key this
relation is in the 2NF. Also, since all the non-key attributes depend only on the primary key, this relation is in the 3NF.

WORK ORDER: WORK ORDER ID(PK), DESCRIPTION, UNIT ID, RESIDENT ID, PRIORITY, PERMISSION

LEASE AGREEMENT: ID(PK), APPLICATION ID, UNIT ID, LEASE LENGTH, MONTHLY RENT, LEASE START, LEASE END

This relation has no multivalued attributes and thus is already in the 1NF. Since all the non-key attributes are functionally dependent on the entire primary key this
relation is in the 2NF. Also, since all the non-key attributes depend only on the primary key, this relation is in the 3NF.
