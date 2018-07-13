1. A sends the request for creating the event
```http
PUT /home/a/calendars/maincalendar.ics HTTP/1.1 %%ICS to where the event goes
If-None-Match: *
Host: cal.example.com
Content-Type: text/calendar
Content-Length: xxxx

%%Insert event ics here
```
2. A gets response from server
```http
HTTP/1.1 201 Created
Content-Length: 0
Date: Sat, 11 Nov 2006 09:32:12 GMT
ETag: "123456789-000-111"
```

3. B gets email about the event

4. B accepts the event

5. B sends mail to his server

6. B's server sends mail to A

7. A updates the event by resending the request
    * Modifying event is similar to "A-creates-event-with-two-other-attendee"