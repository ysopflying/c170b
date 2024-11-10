#AF-394A Nav-O-Matic 300 Autopilot

setprop("/autopilot/AF394A/locks/heading-mode", 1);
setprop("/autopilot/AF394A/locks/nav-mode", 1);
setprop("/autopilot/AF394A/locks/ap-on", 0);
setprop("/autopilot/AF394A/locks/ap-mode", 1);


var apmodo=func{ 

	if ( getprop("/autopilot/AF394A/locks/ap-on") == 1 ){

		if ( getprop("/autopilot/AF394A/locks/ap-mode") == 0 ){
		
			if ( getprop("/autopilot/AF394A/locks/nav-mode") == 1 ) {
				setprop("/autopilot/locks/heading", "nav1-hold");
				setprop("/autopilot/AF394A/locks/heading-mode", 0);
			} else {
				setprop("/autopilot/AF394A/locks/heading-mode", 1);
			}

			if ( getprop("/autopilot/AF394A/locks/heading-mode") == 1 ){
				setprop("/autopilot/locks/heading", "dg-heading-hold");
			}

		} else {
			setprop("/autopilot/locks/heading", "wing-leveler");
		}
	} else {
		setprop("/autopilot/locks/heading", "");
	}
	settimer(apmodo, 0);
}

setlistener("sim/signals/fdm-initialized", apmodo);



