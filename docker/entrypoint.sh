#!/bin/sh
/bin/migrate -verbose -source=file://db/migrations -database $DSN up
/bin/app
