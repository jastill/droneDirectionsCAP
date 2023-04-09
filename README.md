# Rescue Mission

You have been tasked with delivering someemergency energy drinks to Crazy Adrenaline Games to fuel the athletes.

These are not normal athletes, they don't race to win, they race to flip, jump and get as much crazy air as they can.

## Your challenge

Create the delivery map for the autonomous drone and land as close as possible to the finish area to get some gnarly applause. Extra points are earned for style!

![example](images/nodered001.png)


The drone retrieves its direction via an odata service that has the following data requirements:

<pre>
{
  "@odata.context": "$metadata#guidance",
  "value": [
    {
      "id": "0c316757-9aba-4028-bb27-488acc705519",
      "step": 1,
      "command": "takeoff",
      "parameters": null
    },
    {
      "id": "32d56c13-2dc3-4fa0-b41c-d12752a10b67",
      "step": 2,
      "command": "delay",
      "parameters": null
    },
    {
      "id": "4f1d0a17-f4c4-4dab-86f6-cabc2396e593",
      "step": 3,
      "command": "up",
      "parameters": "50"
    },
    {
      "id": "a297a784-c482-44d8-9bce-231bb436cd06",
      "step": 4,
      "command": "delay",
      "parameters": null
    },
    {
      "id": "06c649f2-5fe7-46dd-b76a-f114c515d574",
      "step": 5,
      "command": "land",
      "parameters": null
    }
  ]
}
</pre>


## Tello Drone SDK

https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf

## NodeRed Docker

When running NodeRed in Docker, to access the local CAP application needs the hostname.

host.docker.internal
