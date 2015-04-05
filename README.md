# Suricata Configuration #

## Installation: ##

Run install.sh to install suricata:

```bash
./install.sh
```

The default mode of installation is IDS Mode.
If you want to install in IPS mode run:

```bash
./install.sh -IPS
```

This installs suricata in `/usr/bin` and the configuration files in `/etc/suricata`.

## Running: ##

Next to run suricata in IDS mode:

```bash
./run.sh -IDS ethX
```

where ethx is the interface to monitor traffic on.

To run suricata in IPS mode:

```bash
./run.sh -IPS ethX
```

This will route traffic to suricata using iptables rules.

To see http logs, see `/var/log/suricata/http.log`.

## Log Comparison ##
To compare the logs of squid and suricata run differentiate.py in a directory 
which contains the suricata log (http.log) and squid log (access.log).

For more information refer to the [Reference Manual](./Reference\ Manual.pdf).

## Contact ##
* [Pratik Bhatu](mailto:cs12b1010@iith.ac.in)
* [Ajay Brahmakshtriya](mailto:cs12b1004@iith.ac.in)
