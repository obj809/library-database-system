CREATE DATABASE IF NOT EXISTS slv_library_db;

USE slv_library_db;

CREATE TABLE IF NOT EXISTS Member (
    member_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(120) NOT NULL,
    membership_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    membership_status VARCHAR(20) NOT NULL DEFAULT 'Active',
    PRIMARY KEY (member_id),
    UNIQUE (email),
    CHECK (expiry_date >= membership_date),
    CHECK (membership_status IN ('Active', 'Expired', 'Suspended'))
);

CREATE TABLE IF NOT EXISTS Staff (
    staff_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL,
    employment_date DATE NOT NULL,
    PRIMARY KEY (staff_id),
    UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS Resource (
    resource_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    resource_type VARCHAR(30) NOT NULL,
    publication_year YEAR,
    language VARCHAR(50) NOT NULL,
    subject_area VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Available',
    PRIMARY KEY (resource_id),
    CHECK (resource_type IN ('Book', 'Journal', 'Archive', 'eBook', 'Database')),
    CHECK (status IN ('Available', 'Unavailable', 'Archived'))
);

CREATE TABLE IF NOT EXISTS Location (
    location_code VARCHAR(20) NOT NULL,
    location_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (location_code),
    UNIQUE (location_name)
);

CREATE TABLE IF NOT EXISTS ResourceCopy (
    resource_id INT NOT NULL,
    copy_number INT NOT NULL,
    acquisition_date DATE NOT NULL,
    copy_status VARCHAR(20) NOT NULL DEFAULT 'Available',
    location_code VARCHAR(20) NOT NULL,
    PRIMARY KEY (resource_id, copy_number),
    FOREIGN KEY (resource_id) REFERENCES Resource(resource_id),
    FOREIGN KEY (location_code) REFERENCES Location(location_code),
    CHECK (copy_number > 0),
    CHECK (copy_status IN ('Available', 'On Loan', 'Reserved', 'Maintenance'))
);

CREATE TABLE IF NOT EXISTS MemberPhone (
    member_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    PRIMARY KEY (member_id, phone_number),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE IF NOT EXISTS Loan (
    loan_id INT NOT NULL,
    member_id INT NOT NULL,
    resource_id INT NOT NULL,
    copy_number INT NOT NULL,
    staff_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    loan_status VARCHAR(20) NOT NULL DEFAULT 'Issued',
    PRIMARY KEY (loan_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (resource_id, copy_number) REFERENCES ResourceCopy(resource_id, copy_number),
    CHECK (due_date >= issue_date),
    CHECK (return_date IS NULL OR return_date >= issue_date),
    CHECK (loan_status IN ('Issued', 'Returned', 'Overdue'))
);

CREATE TABLE IF NOT EXISTS Reservation (
    reservation_id INT NOT NULL,
    member_id INT NOT NULL,
    resource_id INT NOT NULL,
    staff_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    reservation_status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (resource_id) REFERENCES Resource(resource_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    CHECK (reservation_status IN ('Pending', 'Confirmed', 'Cancelled', 'Completed'))
);

CREATE TABLE IF NOT EXISTS `Event` (
    event_id INT NOT NULL,
    staff_id INT NOT NULL,
    event_name VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    location VARCHAR(120) NOT NULL,
    description VARCHAR(500),
    event_capacity INT NOT NULL,
    PRIMARY KEY (event_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    CHECK (event_capacity > 0)
);

CREATE TABLE IF NOT EXISTS EventRegistration (
    registration_id INT NOT NULL,
    member_id INT NOT NULL,
    event_id INT NOT NULL,
    registration_date DATE NOT NULL,
    attendance_status VARCHAR(20) NOT NULL DEFAULT 'Registered',
    PRIMARY KEY (registration_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (event_id) REFERENCES `Event`(event_id),
    CHECK (attendance_status IN ('Registered', 'Attended', 'No Show', 'Cancelled'))
);