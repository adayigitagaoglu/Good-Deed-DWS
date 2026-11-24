CREATE TABLE organization (
    id_organization INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE volunteer (
    id_volunteer INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    trust_score DECIMAL(5,2) DEFAULT 5.00
);

CREATE TABLE project (
    id_project INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(150) NOT NULL,
    fk_organization INT NOT NULL,
    FOREIGN KEY (fk_organization) REFERENCES organization(id_organization)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE task (
    id_task INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    task_date DATETIME NOT NULL,
    fk_project INT NOT NULL,
    FOREIGN KEY (fk_project) REFERENCES project(id_project)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE task_assignment (
    id_assignment INT AUTO_INCREMENT PRIMARY KEY,
    fk_volunteer INT NOT NULL,
    fk_task INT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (fk_volunteer) REFERENCES volunteer(id_volunteer)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (fk_task) REFERENCES task(id_task)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO organization (name, contact_email) VALUES
('Maribor Green Youth', 'contact@greenyouth.si'),
('Student Charity Club', 'info@studentcharity.org'),
('Local Animal Shelter', 'help@mariborshelter.si');

INSERT INTO volunteer (name, surname, email, trust_score) VALUES
('Ana', 'Kovac', 'ana.kovac@student.um.si', 4.90),
('Luka', 'Novak', 'luka.novak@student.um.si', 4.50),
('Maja', 'Horvat', 'maja.horvat@student.um.si', 5.00);

INSERT INTO project (description, fk_organization) VALUES
('Community Garden Spring Planting', 1),
('Winter Food & Book Drive', 2),
('Weekend Shelter Support', 3);

INSERT INTO task (description, task_date, fk_project) VALUES
('Bring 5 packs of flower seeds from a local shop', '2026-12-05 10:00:00', 1),
('Carry donation boxes to the community center', '2026-12-06 14:30:00', 2),
('Record two chapters of an audiobook for children', '2026-12-08 18:00:00', 2),
('Walk two shelter dogs in the park for 1 hour', '2026-12-10 09:00:00', 3);

INSERT INTO task_assignment (fk_volunteer, fk_task, status) VALUES
(1, 1, 'Completed'),
(2, 2, 'Pending'),
(3, 2, 'Pending'),
(1, 4, 'Assigned');