# Tor Relay Configurations

This is a simple, sample configuration file that I actively use on my own Tor middle relay.

This repository should allow anyone to launch their own Tor relay on their own machines in less than 3 minutes. If you need more information as to what a *Tor relay* is, consult [this link](https://community.torproject.org/relay/).

## Usage

* Install `tor` (the daemon, **not** the browser) on your Linux/*BSD system.
* Modify [the torrc file](etc/tor/torrc) with your own credentials.
* **If you're using systemd**, run `bash config.sh` in order to install and immediately deploy your new Tor relay.
* Make sure that the `ORPort` and the `DIRPort` ports you're using are open and accessible to the internet. If they're not, the log file (which, by default, will be created in `/var/log/tor/notices.log`) will alert you.

### License

This repository contains scripts that were written by myself. Unless if otherwise stated, they are all licensed under the GNU General Public License v3.

This is to ensure that anyone who may potentially benefit from my work will contribute to its overall impact by spreading it, as well as variations of it, further, so that more people, as well as The Tor Project itself can benefit from it.

#### Disclaimer

This product is produced independently from the Tor® anonymity software and carries no guarantee from The Tor Project about quality, suitability or anything else.

Although these configurations are meant for a Tor middle relay (which, in short, means that no Tor user traffic comes out of your own network onto the clear internet), **this will NOT mean that your IP address will not be subjected to blacklisting**, despite the fact that your node, by default, cannot pose any danger to anyone on the internet.

You can access The Tor Project's website [here](https://www.torproject.org/). Alternatively, if you're currently using the Tor network, you can access their secret service [here](https://expyuzz4wqqyqhjn.onion).
