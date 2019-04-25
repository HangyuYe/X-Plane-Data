//
//  main.cpp
//  xpcExample
//
//  Created by Chris Teubert on 3/27/14.
//  Copyright (c) 2014 Chris Teubert. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#import "xplaneConnect.h"
#ifdef WIN32
#include <Windows.h>
#define sleep(n) Sleep(n * 1000)
#endif

const char* IP = "192.168.1.1";

int connectSIM()
{
    XPCSocket sock = openUDP(IP);
    float tVal[1];
    int tSize = 1;
    if (getDREF(sock, "sim/test/test_float", tVal, &tSize) < 0)
    {
        return EXIT_FAILURE;
    }
    return 0;
}

float getPlaneLAT()
{
    XPCSocket sock = openUDP(IP);
    float POSI[9] = { 0.0 };
    getPOSI(sock, POSI, 0);
    
    return POSI[0];
}

float getPlaneLON()
{
    XPCSocket sock = openUDP(IP);
    float POSI[9] = { 0.0 };
    getPOSI(sock, POSI, 0);
    
    return POSI[1];
}

float getPlaneALT()
{
    XPCSocket sock = openUDP(IP);
    float POSI[9] = { 0.0 };
    getPOSI(sock, POSI, 0);
    
    return POSI[2];
}
