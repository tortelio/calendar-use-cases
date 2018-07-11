1. A sends request to delete an event
```http
DELETE  /container/ HTTP/1.1
Host: www.example.com
```
2. Servers sends confirmation
```http
HTTP/1.1 207 Multi-Status
Content-Type: application/xml; charset="utf-8"
Content-Length: xxxx

<?xml version="1.0" encoding="utf-8" ?>
<d:multistatus xmlns:d="DAV:">
<d:response>
 <d:href>http://www.example.com/container/resource3</d:href>
 <d:status>HTTP/1.1 423 Locked</d:status>
     <d:error><d:lock-token-submitted/></d:error>
</d:response>
</d:multistatus>
```