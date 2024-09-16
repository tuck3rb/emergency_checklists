import 'package:flutter/material.dart';

const Icon warningIcon = Icon(Icons.warning_amber_rounded, color: Colors.white);

List<String> checklists = [
  'Engine Failure (In-Flight Restart)',
  'Engine Fire in Flight',
  'Cabin Fire during Flight',
  'Forced Landing',
  'Spin Recovery',
];

Map<String, List<String>> checklistSteps = {
  'Engine Failure (In-Flight Restart)': [
    'Altitude - BELOW 4000 FT',
    'Carburetor Heat - ON',
    'Electric Fuel Pump - ON',
    'Fuel Selector Valves - BOTH ON',
    'Throttle - MIDDLE POSITION',
    'Ignition Switches - ON',
    'Master Switch - ON'
  ],
  'Engine Fire in-Flight': [
    'Cabin heat - OFF',
    'Fuel selector valves - OFF',
    'Electric fuel pump - OFF',
    'Throttle - FULL IN until the engine stops running',
    'Cabin vents - OPEN',
    'Ignition Switches - OFF',
    'Forced Landing - EXECUTE',
  ],
  'Cabin Fire during Flight':[
    'Cabin heat - OFF',
    'Cabin vents - OPEN',
    'Canopy - OPEN',
    'Master switch - OFF',
    'Try to choke fire with extunguisher towards flame base',
    'Forced Landing - EXECUTE',
  ],
  'Forced Landing' :[
    'Airspeed: - 69 KIAS',
    'Best place to land',
    'Fuel selector valves - OFF',
    'Electric fuel pump - OFF',
    'Ignition Switches - OFF',
    'Safety belts - TIGHTEN',
    'Canopy - LOCKED',
    'Declare Emergency - 121.5 "MAYDAY"',
    'Flaps - AS NECESSSARY',
    'Master switch - OFF',
    'Touchdown Speed: - 51 KIAS'
  ],
  'Spin Recovery' :[
    'Power (throttle) - IDLE',
    'Ailerons - NEUTRAL',
    'Rudder - OPPOSITE OF SPIN',
    'Elevator - FORWARD',
  ]

};
