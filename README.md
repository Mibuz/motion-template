# Usage

Run:

```
$ motion create --template=https://github.com/mibuz/motion-template.git <app_name>
$ cd <app_name>
$ bundle
$ rake pod:install
$ rake
```

## Setup Environment variables

Add this on your ```.bash_profile``` or your ```.zshrc```:

```
export CODESIGN_CERTIFICATE='iPhone Distribution: YOUR NAME (XXXXXXXXXX)'
export ADHOC_PROVISIONING_PROFILE='/path/to/app.mobileprovision'
export TEST_FLIGHT_TOKEN='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

## Testflight

Write your release notes on env/notes/vVERSION.notes.sh:

```
$ vim env/notes/vx.x.x.notes.sh
```

Then run:

```
$ source env/notes/vx.x.x.notes.sh
$ rake testflight
```
