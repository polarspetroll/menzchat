
# menzchat. simple , fast and cool client-server messaging script.
![Alt text](screenshot.png?raw=true "Optional Title")
## How it Works 
there is 2 files , first one is server.rb which is clearly the serverside program. this program will starts the service on your selected port over **tcp** . the protocol could be changed but i recommend to dont use **udp**.
the second file is for client side user . when you execute that it will asks you for username and password (if required).
all done!
## public usage 
if you are trying to chat over **WAN** you need to put the servers public ip for server address. i recommend you to use free and paid port forwarding services such as **ngrok**,**portmap**,**telebit** and ...
## requirements
**colorize**: 
```bash 
$ gem install colorize
```

**socket** (preinstalled with ruby)
## usage 
**clone**:

``
$ git clone https://github.com/polarspetroll/menzchat.git
``

**serverside** : 
```bash
$chmod +x Server.rb

$./Server.rb
```

**clientside** :
```bash
$chmod +x Client.rb

$./Client.rb
```
### tor
you also can use **tor** for better privacy.
