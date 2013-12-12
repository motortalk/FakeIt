# FakeIt! #

A little python WebApp used to send locations over UDP

## Installation ##

```bash
git clone https://github.com/plaetzchen/FakeIt.git
cd FakeIt
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
python fakeit.py
```

## Usage ##

Open http://localhost:8080 in your browser. Insert the IP of your device (localhost for simulator) in the lower right and change the port (if needed). You can send the same location to different ports of the same device by separating the ports with a comma (eg. 9931,9932). Every change will be send to the device immediately.

### Acknowledges ###

Made by @plaetzchen while working at http://www.motor-talk.de