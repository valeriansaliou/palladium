# Palladium Installation

## How to install it?

First, get the Palladium package on the download page. No need to unzip it, it is ready to be sent to our servlet manager: Tomcat. If you don't have any Tomcat server running, you will first need to install it.

It is recommended to proxy the connections between the client and your Tomcat server with an Apache, Lighttpd or nginx proxy to add HTTPS security and have a clean BOSH URL on standard ports (80 for HTTP and 443 for HTTPS).

## Q & A

### Palladium can't open connections to remote XMPP servers, why?

Sometimes, Tomcat is running in security mode. You will have to deactivate it to allow the access to the network. Open the /etc/default/tomcat6 file and set the TOMCAT6_SECURITY setting to no. Ensure the line does not start by #. Then, save the file and restart Tomcat.

### What's the default Palladium URL?

Once Tomcat is launched and Palladium is running, you can access your BOSH server at something like http://server.tld:8180/BOSH/ (the port number can change, depending of the Tomcat version you are using).

### It seems Palladium doesn't close XMPP connections, why?

If you connect to XMPP servers which have invalid TLS certificates, it is possible that Palladium will not be able to close the connections for technical reasons (because of a Java limitation). The number of opened XMPP connections may get really high, but it's not technically a problem (the server load will be okay).

### How can I build Palladium from source code?

The Palladium source code is hosted on our SVN repository. Get it, then install Tomcat 5.5 and Apache to build it. In the Palladium folder, execute the ant command to build it. Now, zip the ./build/ folder you get and change the package type from .zip to .war to get it ready for Tomcat usage.
