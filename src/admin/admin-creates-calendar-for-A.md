1. Admin creates calendar for A
```http
PUT /home/a/calendars/ HTTP/1.1 %%URL to where the calendar goes
If-None-Match: *
Host: cal.example.com
Content-Type: text/calendar
Content-Length: xxxx

%%Insert calendar ics here
```

2. Admin gets response from server
```http
HTTP/1.1 201 Created
Content-Length: 0
Date: Sat, 11 Nov 2006 09:32:12 GMT
ETag: "123456789-000-111"
```

3. A gets email about the new calendar