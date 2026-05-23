USE slv_library_db;

INSERT INTO Member
(member_id, first_name, last_name, address, email, membership_date, expiry_date, membership_status)
VALUES
(101, 'Amelia', 'Brown', '12 Collins St, Melbourne', 'amelia.brown@email.com', '2025-01-15', '2026-01-15', 'Active'),
(102, 'Noah', 'Wilson', '45 Swanston St, Melbourne', 'noah.wilson@email.com', '2024-11-01', '2025-11-01', 'Expired'),
(103, 'Olivia', 'Taylor', '8 Lygon St, Carlton', 'olivia.taylor@email.com', '2025-06-10', '2026-06-10', 'Active'),
(104, 'Liam', 'Johnson', '77 Chapel St, Prahran', 'liam.johnson@email.com', '2025-03-05', '2026-03-05', 'Suspended'),
(105, 'Charlotte', 'Davis', '21 High St, Northcote', 'charlotte.davis@email.com', '2025-09-20', '2026-09-20', 'Active');

INSERT INTO Staff
(staff_id, first_name, last_name, role, phone, email, employment_date)
VALUES
(201, 'Ethan', 'Miller', 'Librarian', '03-9000-1001', 'ethan.miller@slv.vic.gov.au', '2020-02-10'),
(202, 'Sophia', 'Anderson', 'Archivist', '03-9000-1002', 'sophia.anderson@slv.vic.gov.au', '2019-07-01'),
(203, 'James', 'Thomas', 'Events Coordinator', '03-9000-1003', 'james.thomas@slv.vic.gov.au', '2021-01-18'),
(204, 'Mia', 'Jackson', 'Membership Officer', '03-9000-1004', 'mia.jackson@slv.vic.gov.au', '2022-05-22'),
(205, 'Lucas', 'White', 'Digital Services Officer', '03-9000-1005', 'lucas.white@slv.vic.gov.au', '2023-03-14');

INSERT INTO Resource
(resource_id, title, resource_type, publication_year, language, subject_area, status)
VALUES
(301, 'Australian History Essentials', 'Book', 2020, 'English', 'History', 'Available'),
(302, 'Modern Data Systems', 'Journal', 2023, 'English', 'Technology', 'Available'),
(303, 'Victoria Archives Collection', 'Archive', 2018, 'English', 'Government Records', 'Archived'),
(304, 'Digital Research Methods', 'eBook', 2024, 'English', 'Research', 'Available'),
(305, 'Academic Search Premium', 'Database', 2022, 'English', 'Multi-disciplinary', 'Unavailable');

INSERT INTO Location
(location_code, location_name)
VALUES
('L01', 'Reading Room A'),
('L02', 'Archive Storage 1'),
('L03', 'Digital Access Zone'),
('L04', 'Reference Section'),
('L05', 'Exhibition Hall');

INSERT INTO ResourceCopy
(resource_id, copy_number, acquisition_date, copy_status, location_code)
VALUES
(301, 1, '2021-02-15', 'Available', 'L01'),
(302, 1, '2023-08-10', 'On Loan', 'L04'),
(303, 1, '2019-01-05', 'Maintenance', 'L02'),
(304, 1, '2024-03-20', 'Reserved', 'L03'),
(305, 1, '2022-11-11', 'Available', 'L03');

INSERT INTO MemberPhone
(member_id, phone_number)
VALUES
(101, '+61411111111'),
(102, '+61422222222'),
(103, '+61433333333'),
(104, '+61444444444'),
(105, '+61455555555');

INSERT INTO Loan
(loan_id, member_id, resource_id, copy_number, staff_id, issue_date, due_date, return_date, loan_status)
VALUES
(401, 101, 301, 1, 201, '2026-03-01', '2026-03-15', '2026-03-12', 'Returned'),
(402, 102, 302, 1, 202, '2026-03-20', '2026-04-03', NULL, 'Issued'),
(403, 103, 303, 1, 203, '2026-02-01', '2026-02-14', '2026-02-20', 'Overdue'),
(404, 104, 304, 1, 204, '2026-01-10', '2026-01-24', '2026-01-23', 'Returned'),
(405, 105, 305, 1, 205, '2026-04-01', '2026-04-15', NULL, 'Issued');

INSERT INTO Reservation
(reservation_id, member_id, resource_id, staff_id, reservation_date, reservation_status)
VALUES
(501, 101, 305, 201, '2026-04-05', 'Pending'),
(502, 102, 301, 202, '2026-04-02', 'Confirmed'),
(503, 103, 304, 203, '2026-03-30', 'Cancelled'),
(504, 104, 302, 204, '2026-04-01', 'Completed'),
(505, 105, 303, 205, '2026-04-06', 'Pending');

INSERT INTO `Event`
(event_id, staff_id, event_name, event_date, event_time, location, description, event_capacity)
VALUES
(601, 203, 'Family History Workshop', '2026-05-12', '10:00:00', 'Theatrette', 'Workshop on genealogy research tools', 40),
(602, 201, 'Rare Books Exhibition Tour', '2026-05-18', '14:00:00', 'Exhibition Hall', 'Guided tour of rare books collection', 30),
(603, 202, 'Archive Preservation Talk', '2026-06-02', '11:30:00', 'Seminar Room 1', 'Talk on archival preservation practices', 50),
(604, 204, 'New Member Orientation', '2026-04-20', '09:30:00', 'Reading Room A', 'Orientation for new members', 60),
(605, 205, 'Digital Databases Training', '2026-05-25', '15:00:00', 'Digital Access Zone', 'Hands-on database search training', 35);

INSERT INTO EventRegistration
(registration_id, member_id, event_id, registration_date, attendance_status)
VALUES
(701, 101, 601, '2026-04-10', 'Registered'),
(702, 102, 602, '2026-04-11', 'Cancelled'),
(703, 103, 603, '2026-04-12', 'Registered'),
(704, 104, 604, '2026-04-13', 'Attended'),
(705, 105, 605, '2026-04-14', 'No Show');

SELECT * FROM Member;
SELECT * FROM Staff;
SELECT * FROM Resource;
SELECT * FROM Location;
SELECT * FROM ResourceCopy;
SELECT * FROM MemberPhone;
SELECT * FROM Loan;
SELECT * FROM Reservation;
SELECT * FROM `Event`;
SELECT * FROM EventRegistration;