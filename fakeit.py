from bottle import route, view, request, run, template
import socket
import json


@route('/')
def index():
    return template('index_template')

@route('/ajax/send/location', method='POST')
def sendLocation():
    locationDict = request.json['location']
    deviceDict = request.json['device']
    deviceIP = deviceDict['ip']
    devicePorts = deviceDict['port']
    devicePortsList = devicePorts.split(',')
    for port in devicePortsList:
        sendLocation(locationDict,deviceIP,int(port))
    
def sendLocation(dict,ip,port):
    message = json.dumps(dict)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto(message, (ip, port))
run(host='localhost', port=8080, debug=True)
