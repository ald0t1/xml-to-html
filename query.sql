SELECT 
    XMLSERIALIZE(
        DOCUMENT XMLELEMENT(
            NAME "Orari",
            XMLAGG(
                XMLELEMENT(NAME "Rreshti",
                    XMLATTRIBUTES(
                        Dega AS "Dega",
                        Viti AS "Viti",
                        Paraleli AS "Paraleli"
                    ),
                    XMLELEMENT(NAME "Lenda", Lenda),
                    XMLELEMENT(NAME "Tipi", Tipi),
                    XMLELEMENT(NAME "Pedagog", Pedagog),
                    XMLELEMENT(NAME "Dita", Dita),
                    XMLELEMENT(NAME "Klasa", Klasa),
                    XMLELEMENT(NAME "Ora", Ora)
                )
            )
        )
        AS TEXT
    ) AS "XMLData"
FROM timetable;


CREATE TABLE timetable (
    Dega text,
    Viti integer,
    Paraleli text,
    Lenda text,
    Tipi text,
    Pedagog text,
    Dita text,
    Klasa text,
    Ora text
);

-- psql copy csv
\copy timetable FROM '~detyra.csv' WITH (FORMAT CSV, HEADER);
