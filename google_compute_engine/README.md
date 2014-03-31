Deploy to Google Compute Engine
=======

* You need to set the meta tag `deploy-hq-key` when starting a box.
* You need to set the meta tag `newrelic-license` **before** starting a box.
* You need to have gcutil installed.

Launch server with `bash launch-with-gcutil.sh {your project name} {instance name} {deployhq key}`

For example: `bash launch-with-gcutil.sh l305-c1 l305-dev-wk1 "ssh-rsa SSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJESSSHRSAKEYDINGENTJES DeployHQ.com Key for Label305"`