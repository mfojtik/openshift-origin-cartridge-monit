# OpenShift monit cartridge

This GIT repository contains a downloadable [monit](http://mmonit.com/monit)
cartridge than OpenShift users can use to monitor various metrics in their
applications, like memory usage, quota usage, etc.

Users can configure alert email to receive notifications. To do so, you need
to set `MONIT_ALERT_EMAIL` before installing the cartridge:

```
rhc env set MONIT_ALERT_EMAIL=my@email.com -a YOUR_APP
```

After this, you can add this cartridge to your application:

```
rhc cartridge-add http://goo.gl/eGL2Bs -a YOUR_APP
```

## What you get for free :-)

### OpenShift memory quota

If you are using OpenShift Online with 'Free' account, then your gears are
limited to 512MB of memory. In case your application grow beyond this amount,
OpenShift will kill it and then try to restart it. However, you will not receive
any email that this happened. This cartridge will send you email when your
application is using 80% of the gear memory and automatically restart your
application when it is using 90% of gear mem.


### OpenShift storage quota

All gears have fixed storage quota set on OpenShift. In case your application
grows (apache logs, etc), this cartridge will send you email if you are at 80%
of gear capacity. If your application goes more than 90% of the gear capacity,
this cartridge will run `tidy` operation, which will clean up all logs in order
to free some storage.

### OpenShift application availability

The default monit configure provide periodical check  of availability of your
application. If you app goes down for whatever reason, an alert is send to your
email and if your app is down for longer than 1.5 minute, monit will try to
restart the primary cartridge to fix it.


### Custom rules

The `.monitrc` file is available to you in your gear home directory. To add more
rules or change the default rules, you need to do `rhc ssh` into your
application and edit `.monitrc` file. You can find more complex examples of
monit rules on monit [site](http://mmonit.com/monit/documentation/monit.html).

### Monit Service Manager

Monit comes with a simple web-interface where you can see the status of things
that are monitored. You can access this web interface by visiting the
`/monit-status` URI in your application.
You will be prompted for a password, which is printed out to console when you
finish installing this cartridge.
If you loose this password, you need to ssh into the gear and execute:

`env | grep -r MONIT_PASSWORD`

### Note about scripts

As you can see in default `monitrc`, you can't simply execute the 'control
start', but you need to wrap this script by `oo-env.sh` wrapper. This is due to
limitation of Monit itself, described here: http://mmonit.com/wiki/Monit/FAQ#execution
