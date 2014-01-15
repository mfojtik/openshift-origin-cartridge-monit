# OpenShift monit cartridge

This GIT repository contains a downloadable [monit](http://mmonit.com/monit)
cartridge than OpenShift users can use to monitor various metrics in their
applications, like memory usage, quota usage, etc.

Users can configure alert email to receive notifications. To do so, you need
to set `MONIT_ALERT_EMAIL` before installing the cartridge:

```
rhc env set MONIT_ALERT_EMAIL=my@email.com
```

After this, you can add this cartridge to your application:

```
rhc cartridge-add https://raw2.github.com/mfojtik/openshift-origin-cartridge-monit/master/metadata/manifest.yml -a YOUR_APP
```
