SELECT GUEST_CARD.first_name, GUEST_CARD.last_name, FLOORPLAN.name, FLOORPLAN.bedrooms, FLOORPLAN.bathrooms
FROM GUEST_CARD, FLOORPLAN, RESIDENT, UNIT
WHERE GUEST_CARD.guest_card_id = RESIDENT.resident_id AND RESIDENT.unit_id = UNIT.unit_id AND FLOORPLAN.floorplan_id = UNIT.floorplan_id

SELECT GUEST_CARD.first_name, GUEST_CARD.last_name, EMPLOYEE.first_name, EMPLOYEE.last_name
FROM GUEST_CARD, EMPLOYEE
WHERE GUEST_CARD.employee_id = EMPLOYEE.employee_id

SELECT GUEST_CARD.first_name, GUEST_CARD.last_name, UNIT.unit_no, WORK_ORDER.description
FROM (((GUEST_CARD
INNER JOIN RESIDENT ON GUEST_CARD.guest_card_id = RESIDENT.guest_card_id)
INNER JOIN UNIT ON RESIDENT.unit_id = UNIT.unit_id)
INNER JOIN WORK_ORDER ON UNIT.unit_id = WORK_ORDER.unit_id)


