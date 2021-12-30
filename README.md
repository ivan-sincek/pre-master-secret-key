# Pre-Master Secret Key

Just a simple Batch script that will help you set up all you need to capture pre-master secret keys to decrypt SSL in Wireshark.

Script will create SSLKEYLOGFILE environment variable and `ssl-key.log` file on your desktop.

Reference point was this [article](https://www.comparitech.com/net-admin/decrypt-ssl-with-wireshark).

Tested with Wireshark v3.2.6 (64-bit) on Windows 10 Enterprise OS (64-bit).

Made for educational purposes. I hope it will help!

## How to Run

Double click on the script or open the Command Prompt from [\\src\\](https://github.com/ivan-sincek/pre-master-secret-key/tree/master/src) and run the following command:

```fundamental
pre_master_secret_key.bat
```

Open Wireshark and go to `Edit -> Preferences -> Protocols -> TLS` and load the path to `ssl-keys.log` into `(Pre-)Master-Secret log filename` input filed.

Start recording network traffic.

If you suddenly cannot delete the log file even after closing the web browser, it is possible that some other program is still writing in the file, e.g OneDrive, Dropbox, etc.

## Images

<p align="center"><img src="https://github.com/ivan-sincek/pre-master-secret-key/blob/master/img/run_create.jpg" alt="Run (Create)"></p>

<p align="center">Figure 1 - Run (Create)</p>

<p align="center"><img src="https://github.com/ivan-sincek/pre-master-secret-key/blob/master/img/run_remove.jpg" alt="Run (Remove)"></p>

<p align="center">Figure 2 - Run (Remove)</p>
