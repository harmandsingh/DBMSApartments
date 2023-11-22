SELECT
    GUEST_CARD.first_name AS guest_first_name,
    GUEST_CARD.last_name AS guest_last_name,
    FLOORPLAN.name AS floorplan_name,
    FLOORPLAN.bedrooms AS flootplan_bedrooms,
    FLOORPLAN.bathrooms AS floorplan_bathrooms
FROM GUEST_CARD, FLOORPLAN, RESIDENT, UNIT
WHERE GUEST_CARD.guest_card_id = RESIDENT.resident_id AND RESIDENT.unit_id = UNIT.unit_id AND FLOORPLAN.floorplan_id = UNIT.floorplan_id;

SELECT
    GUEST_CARD.first_name AS guest_first_name,
    GUEST_CARD.last_name AS guest_last_name,
    EMPLOYEE.first_name AS employee_first_name,
    EMPLOYEE.last_name AS employee_last_name
FROM GUEST_CARD, EMPLOYEE
WHERE GUEST_CARD.employee_id_fk = EMPLOYEE.employee_id;

SELECT
    GUEST_CARD.first_name AS guest_first_name,
    GUEST_CARD.last_name AS guest_last_name,
    UNIT.unit_no AS unit_number,
    WORK_ORDER.description AS work_order_description
FROM GUEST_CARD
INNER JOIN RESIDENT ON GUEST_CARD.guest_card_id = RESIDENT.guest_card_id
INNER JOIN UNIT ON RESIDENT.unit_id = UNIT.unit_id
INNER JOIN WORK_ORDER ON UNIT.unit_id = WORK_ORDER.unit_id;