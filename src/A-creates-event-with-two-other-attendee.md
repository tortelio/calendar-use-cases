1. A creates event with B and C
```http
PUT /home/A/calendar/event/uniqueEventIdentifier.ics HTTP/1.1
If-None-Match: *
Host: cal.example.com
Content-Type: text/calendar
Content-Length: x

uniqueEventIdentifier.ics
BEGIN: VCALENDAR
Version: 2.0
PRODID: -//Company//CalDAV Client// EN
BEGIN:VEVENT
UID:identifier
DTSTAMP:20180710T130000Z
DTSTART:20180710T180000Z
DTEND:20180710T200000Z
SUMMARY: Main Event
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="A.user":mailto:a@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-ACTION;CN="B.user":mailto:b@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-ACTION;CN="C.user":mailto:c@example.com
END:VEVENT
END:VCALENDAR
```
2. Server send answer to the reqeust
```http
HTTP/1.1 201 Created
Content-Length: 0
Date: 10 Jul 2018 13:00:00 GMT
ETag: "500"
```
3. B and C gets an e-mail regarding the event

4. B accepts the invitation

5. B sends mail to his server

6. B's server sends mail to A

7. A updates the event with B as an attendee
```http
PUT /home/B/calendar/event/anotherUniqueEventIdentifier.ics HTTP/1.1
If-Match: 500
Host: cal.example.com
Content-Type: text/calendar
Content-Length: x

>uniqueEventIdentifier.ics<
BEGIN: VCALENDAR
Version: 2.0
PRODID: -//Company//CalDAV Client// EN
BEGIN:VEVENT
UID:identifier
DTSTAMP:20180710T130000Z
DTSTART:20180710T180000Z
DTEND:20180710T200000Z
SUMMARY: Main Event
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="A.user":mailto:a@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="B.user":mailto:b@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-ACTION;CN="C.user":mailto:c@example.com
END:VEVENT
END:VCALENDAR
```
8. Server sends answer to the request
```http
HTTP/1.1 201 Created
Content-Length: 0
Date: 10 Jul 2018 13:00:00 GMT
ETag: "501"
```
9. C declines the invitation

10. A updates the event with C not attending the event
```http
PUT /home/C/calendar/event/anotherUniqueEventIdentifier.ics HTTP/1.1
If-Match: 501
Host: cal.example.com
Content-Type: text/calendar
Content-Length: x

>uniqueEventIdentifier.ics<
BEGIN: VCALENDAR
Version: 2.0
PRODID: -//Company//CalDAV Client// EN
BEGIN:VEVENT
UID:identifier
DTSTAMP:20180710T130000Z
DTSTART:20180710T180000Z
DTEND:20180710T200000Z
SUMMARY: Main Event
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="A.user":mailto:a@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="B.user":mailto:b@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NOT-ATTENDING;CN="C.user":mailto:c@example.com
END:VEVENT
END:VCALENDAR

>>Response<<
HTTP/1.1 201 Created
Content-Length: 0
Date: 10 Jul 2018 13:00:00 GMT
ETag: "502"

%%% A modify the event
>> Request <<
PUT /home/A/calendar/event/uniqueEventIdentifier.ics HTTP/1.1
If-None-Match: *
Host: cal.example.com
Content-Type: text/calendar
Content-Length: x

>uniqueEventIdentifier.ics<
BEGIN: VCALENDAR
Version: 2.0
PRODID: -//Company//CalDAV Client// EN
BEGIN:VEVENT
UID:identifier
DTSTAMP:20180710T130000Z
DTSTART:20180710T180000Z
DTEND:20180710T200000Z
SUMMARY: Main Event
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=ATTENDING;CN="A.user":mailto:a@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-ACTION;CN="B.user":mailto:b@example.com
ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEED-ACTION;CN="C.user":mailto:c@example.com
END:VEVENT
END:VCALENDAR
```
11. Server sends answer to the request
```http
HTTP/1.1 201 Created
Content-Length: 0
Date: 10 Jul 2018 13:00:00 GMT
ETag: "503"
```