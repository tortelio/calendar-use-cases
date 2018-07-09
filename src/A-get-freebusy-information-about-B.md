1. Checks B is free or busy between X Y time

```http
REPORT **USER-URL** HTTP/1.1
Host: **HOST**
Depth: 1
Content-Type: application/xml; charset="utf-8"
Content-Length: xxxx

<?xml version="1.0" encoding="utf-8" ?>
<C:free-busy-query xmlns:C="urn:ietf:params:xml:ns:caldav">
  <C:time-range start=**X** end=**Y**/>
</C:free-busy-query>
```

2. Forwards the request
    * this request is similar with the request of user (1.)

3. Send answer
    * this request is similar with the answer to user (4.)

4. Send answer

```http
HTTP/1.1 200 OK
Date: Sat, 11 Nov 2006 09:32:12 GMT
Content-Type: text/calendar
Content-Length: xxxx

BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Example Corp.//CalDAV Server//EN
BEGIN:VFREEBUSY
DTSTAMP:20050125T090000Z
DTSTART:**X**
DTEND:**Y**
FREEBUSY;FBTYPE=BUSY-TENTATIVE:20060104T150000Z/PT1H
FREEBUSY:20060104T190000Z/PT1H
END:VFREEBUSY
END:VCALENDAR
```
