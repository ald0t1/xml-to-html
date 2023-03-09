CREATE TABLE majors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO majors (name)
VALUES ('Computer Science'), ('Electrical Engineering'), ('Mechanical Engineering');


CREATE TABLE years (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO years (name)
VALUES ('First Year'), ('Second Year'), ('Third Year'), ('Fourth Year');


CREATE TABLE schedules (
    id SERIAL PRIMARY KEY,
    major_id INTEGER REFERENCES majors(id) NOT NULL,
    year_id INTEGER REFERENCES years(id) NOT NULL,
    class TEXT NOT NULL,
    day TEXT NOT NULL,
    subject TEXT NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT NOT NULL
);


INSERT INTO schedules (major_id, year_id, class, day, subject, start_time, end_time)
VALUES
    (1, 1, 'A', 'Monday', 'Programming Fundamentals', '9:00 AM', '10:30 AM'),
    (1, 1, 'A', 'Monday', 'Data Structures and Algorithms', '11:00 AM', '12:30 PM'),
    (1, 1, 'A', 'Tuesday', 'Web Development', '9:00 AM', '10:30 AM'),
    (1, 1, 'A', 'Tuesday', 'Database Systems', '11:00 AM', '12:30 PM'),
    (1, 1, 'B', 'Wednesday', 'Operating Systems', '9:00 AM', '10:30 AM'),
    (1, 1, 'B', 'Wednesday', 'Computer Networks', '11:00 AM', '12:30 PM');



SELECT XMLELEMENT(
    NAME "schedules",
    XMLAGG(
        XMLELEMENT(
            NAME "schedule",
            XMLATTRIBUTES(m.name AS major, y.name AS year, s.class),
            XMLELEMENT(NAME "day", s.day),
            XMLELEMENT(NAME "subject", s.subject),
            XMLELEMENT(NAME "start_time", s.start_time),
            XMLELEMENT(NAME "end_time", s.end_time)
        )
    )
)
FROM schedules s
INNER JOIN majors m ON m.id = s.major_id
INNER JOIN years y ON y.id = s.year_id;
