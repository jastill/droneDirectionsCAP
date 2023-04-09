# Rescue Mission

You have been tasked with delivering someemergency energy drinks to Crazy Adrenaline Games to fuel the athletes.

These are not normal athletes, they don't race to win, they race to flip, jump and get as much crazy air as they can.

## Your challenge

Create the delivery map for the autonomous drone and land as close as possible to the finish area to get some gnarly applause. Extra points are earned for style!

### Operational values

The drone retrieves its direction via a public odata service without authenticaion that has the following data requirements. An object contains an array for direction objects.

Direction Object:
 o step - Required, numeric value identifying the order of the command.
 o command - Required, the drone command to be issued 
 o parameters - Optional, if the command requires parameters, they are passed here seperated by spaces.

<pre>
{
  "value": [
    {
      "step": 1,
      "command": "takeoff",
      "parameters": null
    },
    {
      "step": 2,
      "command": "delay",
      "parameters": null
    },
    {
      "step": 3,
      "command": "up",
      "parameters": "50"
    },
    {
      "step": 4,
      "command": "delay",
      "parameters": null
    },
    {
      "step": 5,
      "command": "land",
      "parameters": null
    }
  ]
}
</pre>

## Drone Commands

The drone commands work on an open loop system, this means that there is no confirmation that a command was successful. The guidance must take this into account.

If the drone is performing an existing operation and a new command is received, that command is ignored. This requires that delays must be used to factor in command execution times.

Each command is sent rate limited to 5s, so to create a longer interval send a delay command without a parameter. The parameter is ignored by the drone controller if sent.

e.g.

|Step|Command and Parameters|Description|Execution Time|
|:--|:--|:--|:--|
|1| takeoff |This can take some time for the drone to stabilize.|0s|
|2| delay |Add an extra 5s delay.|5s|
|3| forward 50 |Move the drone forward 50cm.|10s|
|4| flip l|Flip the drone left|15s|

### Basic Commands
|Command|Description|Example|
|:--|:--|:--|
|takeoff|drone takes off and stabilizes, this can take a few seconds|takeoff|
|land|drone tries to land and find flat area|land|
|up x|Go up x cm x=20-500|up 50|
|down x|Go down x cm x=20-500|down 30|
|forward x|Go forward x cm x=20-500|forward 30|
|back x|Go back x cm x=20-500|back 50|
|left x|Go left x cm x=20-500|left 30|
|right x|Go right x cm x=20-500|right 20|
|flip x|Flip the drone direction l=left r=right f=forward b=backward|flip l|
|cw x|Rotate x degrees clockwise x=1-360|cw 90|
|ccw x|Rotate x degrees counterclockwise x=1-360|ccw 90|
|speed x|Set the speed in cm/s x=10-100 |speed 10|
|stop|Hovers in the air, works anytime|stop|

There are more advanced commands available in the [sdk](https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf), but not used for this exercise.

## Architecture

The drone used is a [Tello Drone](https://www.ryzerobotics.com/tello) that is safe to fly indoors and also includes an [SDK](https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf).

Each drone is controlled by a [Raspberry Pi](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) running [NodeRed](https://nodered.org/) in multiple docker containers.

Each Raspberry Pi is connected to a router, that also allows the challengers to connect to and have their own playground.

## Tello Drone SDK

https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf

## NodeRed Docker

![example](images/nodered001.png)

When running NodeRed in Docker on a desktop, to access the local CAP application needs an accesible hostname.

host.docker.internal
