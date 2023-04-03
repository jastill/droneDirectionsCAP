using mobi.astill.drone.guidance as my from '../db/guidance';

service DroneGuidance {
		entity guidance as projection on my.GuidanceSteps;
}

