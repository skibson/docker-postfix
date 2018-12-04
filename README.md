# docker-postfix
Dead simple postfix. Based on Alpine Linux.

## TL;DR

To run the container, do the following:
```
docker run --rm --name postfix -p 587:587 skibaja/postfix
```

You can now send emails by using `localhost:587` as your SMTP server address. **Please note that
the image uses the submission (587) port by default**. Port 25 is not exposed on purpose, as it's
regularly blocked by ISP or already occupied by other services.

All standard caveats of configuring the SMTP server apply -- e.g. you'll need to make sure your DNS
entries are updated properly if you don't want your emails marked as spam.

## Configuration options

The following configuration options are available:
```
ENV vars
$HOSTNAME = Postfix myhostname
```
### `HOSTNAME`

You may configure a specific hostname that the SMTP server will use to identify itself. If you don't do it,
the default Docker host name will be used. A lot of times, this will be just the container id (e.g. `f73792d540a5`)
which may make it difficult to track your emails in the log files. If you care about tracking at all,
I suggest you set this variable, e.g.:
```
docker run --rm --name postfix -e HOSTNAME=postfix-docker -p 1587:587 boky/postfix
```
```
