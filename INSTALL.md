# Palladium Installation

## How to install it?

To get a compiled package, download the Palladium http-bind.war from the project root folder. It is ready to be sent to servlet container. Easiest way is to put it into webapps folder and restart Tomcat. If you don't have any Tomcat server running, you will first need to install it. This version was tested with Java7 and Tomcat7.

It is recommended to proxy the connections between the client and your Tomcat server with an Apache, Lighttpd or nginx proxy to add HTTPS security and have a clean BOSH URL on standard ports (80 for HTTP and 443 for HTTPS).

## Q & A

### Palladium can't open connections to remote XMPP servers, why?

Sometimes, Tomcat is running in security mode. You will have to deactivate it to allow the access to the network. Open the /etc/default/tomcat6 file and set the TOMCAT6_SECURITY setting to no. Ensure the line does not start by #. Then, save the file and restart Tomcat.

### What's the default Palladium URL?

Once Tomcat is launched and Palladium is running, you can access your BOSH server at something like http://server.tld:8180/http-bind (the port number can change, depending of the Tomcat version you are using).

### It seems Palladium doesn't close XMPP connections, why?

If you connect to XMPP servers which have invalid TLS certificates, it is possible that Palladium will not be able to close the connections for technical reasons (because of a Java limitation). The number of opened XMPP connections may get really high, but it's not technically a problem (the server load will be okay).

### How can I build Palladium from source code?

Get the Palladium source code from GIT repository. Then install Tomcat 7 to build it. In the Palladium folder, execute the "ant dist" command to build it. You should get http-bind.war file in your project root folder. Now it can be placed to Tomcat's webapps folder. In default Ubuntu setup, Tomcat would auto-deploy it.
