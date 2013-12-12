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

Open http://localhost:8080 in your browser. Insert the IP of your device (localhost for simulator) in the lower right and inser the port if you have changed it. You can send the same location to different ports of the same device by sepparting the ports with a comma. Every change will be send to the device immediately after you change something.
