-- 
-- North Fleet Sailor SAI
SET @ENTRY := 23866;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,10000,10000,10000,10000,49,0,0,0,0,0,0,19,23865,10,0,0,0,0,0,"North Fleet Sailor - Out of Combat - Start Attacking");

UPDATE `creature` SET `position_x`=2315.688,`position_y`=-5998.779,`position_z`=2.620016 WHERE `guid`=200011;
-- Winterskorn Scout SAI
SET @GUID := -200011;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=24116;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,25,0,100,0,0,0,0,0,53,0,2000110,1,0,0,2,1,0,0,0,0,0,0,0,"Winterskorn Scout - On Reset - Start Waypoint"),
(@GUID,0,1,2,40,0,100,0,6,2000110,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Winterskorn Scout - On Waypoint 6 Reached - Pause Waypoint"),
(@GUID,0,2,0,61,0,100,0,6,2000110,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Winterskorn Scout - On Waypoint 6 Reached - Play Emote 1"),
(@GUID,0,3,0,40,0,100,0,13,2000110,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Winterskorn Scout - On Waypoint 13 Reached - Pause Waypoint");

SET @PATH := 2000110;
DELETE FROM `waypoints` WHERE `entry`=@PATH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(@PATH,1,2315.688,-5998.779,2.620016),
(@PATH,2,2315.938,-5997.279,2.120016),
(@PATH,3,2316.201,-5997.023,2.256905),
(@PATH,4,2316.451,-5995.273,2.006905),
(@PATH,5,2316.451,-5993.023,2.006905),
(@PATH,6,2316.701,-5991.023,2.006905),
(@PATH,7,2316.608,-5990.383,1.743775),
(@PATH,8,2316.304,-5992.458,2.601433),
(@PATH,9,2315.804,-5994.958,1.851433),
(@PATH,10,2315.554,-5997.208,2.351433),
(@PATH,11,2315.554,-5998.208,2.601433),
(@PATH,12,2314.804,-6002.708,2.101433),
(@PATH,13,2314.5,-6004.032,1.959091);

DELETE FROM `creature_addon` WHERE `guid`=200012;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(200012,0,0,1,1,0, '');

-- Winterskorn Scout SAI
SET @GUID := -200012;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=24116;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,1,0,100,0,2000,2000,2000,2000,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Winterskorn Scout - Out of Combat - Play Emote 7");

-- 
-- Giants RUN -- 
-- 
-- Iron Rune Stonecaller SAI
SET @ENTRY := 24030;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,12000,25000,11,43269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Iron Rune Stonecaller - Out of Combat - Cast 'Summon Stone Giant'");

SET @NPC := 120132;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2205.236,`position_y`=-5883.114,`position_z`=234.0254 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2205.236,-5883.114,234.0254,0,0,0,0,100,0),
(@PATH,2,2202.736,-5884.864,233.2754,0,0,0,0,100,0),
(@PATH,3,2200.736,-5886.364,232.5254,0,0,0,0,100,0),
(@PATH,4,2199.236,-5887.614,232.2754,0,0,0,0,100,0),
(@PATH,5,2196.736,-5889.364,231.5254,0,0,0,0,100,0),
(@PATH,6,2197.222,-5889.061,231.8507,0,0,0,0,100,0),
(@PATH,7,2199.722,-5887.311,232.3507,0,0,0,0,100,0),
(@PATH,8,2200.972,-5886.311,232.8507,0,0,0,0,100,0),
(@PATH,9,2204.222,-5883.811,233.8507,0,0,0,0,100,0),
(@PATH,10,2205.595,-5882.668,234.1769,0,0,0,0,100,0),
(@PATH,11,2214.723,-5867.117,234.3781,0,0,0,0,100,0),
(@PATH,12,2223.223,-5854.617,233.8781,0,0,0,0,100,0),
(@PATH,13,2229.723,-5845.117,234.6281,0,0,0,0,100,0),
(@PATH,14,2232.973,-5840.117,233.6281,0,0,0,0,100,0),
(@PATH,15,2233.973,-5838.367,233.1281,0,0,0,0,100,0),
(@PATH,16,2235.879,-5835.819,232.8821,0,0,0,0,100,0),
(@PATH,17,2244.879,-5824.069,233.3821,0,0,0,0,100,0),
(@PATH,18,2248.129,-5820.319,233.8821,0,0,0,0,100,0),
(@PATH,19,2251.129,-5816.319,234.6321,0,0,0,0,100,0),
(@PATH,20,2251.333,-5816.246,234.7803,0,0,0,0,100,0),
(@PATH,21,2251.583,-5815.996,234.7803,0,0,0,0,100,0),
(@PATH,22,2253.583,-5815.996,235.5303,0,0,0,0,100,0),
(@PATH,23,2256.583,-5816.246,236.0303,0,0,0,0,100,0),
(@PATH,24,2260.583,-5816.246,236.5303,0,0,0,0,100,0),
(@PATH,25,2263.333,-5816.496,237.2803,0,0,0,0,100,0),
(@PATH,26,2266.333,-5816.496,238.0303,0,0,0,0,100,0),
(@PATH,27,2269.333,-5816.496,238.7803,0,0,0,0,100,0),
(@PATH,28,2273.333,-5816.746,239.2803,0,0,0,0,100,0),
(@PATH,29,2273.584,-5816.578,239.4526,0,0,0,0,100,0),
(@PATH,30,2274.084,-5816.578,239.7026,0,0,0,0,100,0),
(@PATH,31,2277.084,-5816.578,240.2026,0,0,0,0,100,0),
(@PATH,32,2280.084,-5816.578,240.7026,0,0,0,0,100,0),
(@PATH,33,2283.084,-5816.578,241.4526,0,0,0,0,100,0),
(@PATH,34,2284.834,-5816.578,241.9526,0,0,0,0,100,0),
(@PATH,35,2286.834,-5816.578,242.7026,0,0,0,0,100,0),
(@PATH,36,2288.834,-5816.578,243.2026,0,0,0,0,100,0),
(@PATH,37,2290.834,-5816.578,243.9526,0,0,0,0,100,0),
(@PATH,38,2293.834,-5816.578,244.9526,0,0,0,0,100,0),
(@PATH,39,2294.101,-5816.669,245.2336,0,0,0,0,100,0),
(@PATH,40,2295.601,-5816.669,245.4836,0,0,0,0,100,0),
(@PATH,41,2298.601,-5816.669,246.2336,0,0,0,0,100,0),
(@PATH,42,2300.601,-5816.669,246.7336,0,0,0,0,100,0),
(@PATH,43,2303.601,-5816.919,247.4836,0,0,0,0,100,0),
(@PATH,44,2305.601,-5816.919,247.9836,0,0,0,0,100,0),
(@PATH,45,2307.351,-5817.169,248.4836,0,0,0,0,100,0),
(@PATH,46,2310.351,-5817.169,249.2336,0,0,0,0,100,0),
(@PATH,47,2312.351,-5817.169,249.7336,0,0,0,0,100,0),
(@PATH,48,2314.351,-5817.169,250.4836,0,0,0,0,100,0),
(@PATH,49,2317.351,-5817.419,250.9836,0,0,0,0,100,0),
(@PATH,50,2320.351,-5817.419,251.7336,0,0,0,0,100,0),
(@PATH,51,2317.865,-5817.402,251.3246,0,0,0,0,100,0),
(@PATH,52,2314.865,-5817.152,250.5746,0,0,0,0,100,0),
(@PATH,53,2311.865,-5817.152,249.8246,0,0,0,0,100,0),
(@PATH,54,2309.865,-5817.152,249.0746,0,0,0,0,100,0),
(@PATH,55,2308.115,-5817.152,248.5746,0,0,0,0,100,0),
(@PATH,56,2306.115,-5817.152,248.0746,0,0,0,0,100,0),
(@PATH,57,2304.115,-5816.902,247.5746,0,0,0,0,100,0),
(@PATH,58,2301.115,-5816.902,246.8246,0,0,0,0,100,0),
(@PATH,59,2299.115,-5816.652,246.3246,0,0,0,0,100,0),
(@PATH,60,2296.115,-5816.652,245.5746,0,0,0,0,100,0),
(@PATH,61,2295.889,-5816.669,245.3645,0,0,0,0,100,0),
(@PATH,62,2295.389,-5816.669,245.3645,0,0,0,0,100,0),
(@PATH,63,2293.389,-5816.669,244.6145,0,0,0,0,100,0),
(@PATH,64,2290.389,-5816.669,243.6145,0,0,0,0,100,0),
(@PATH,65,2288.389,-5816.669,243.1145,0,0,0,0,100,0),
(@PATH,66,2286.389,-5816.669,242.3645,0,0,0,0,100,0),
(@PATH,67,2284.639,-5816.669,241.8645,0,0,0,0,100,0),
(@PATH,68,2281.639,-5816.669,241.3645,0,0,0,0,100,0),
(@PATH,69,2278.639,-5816.669,240.6145,0,0,0,0,100,0),
(@PATH,70,2275.639,-5816.669,239.8645,0,0,0,0,100,0),
(@PATH,71,2275.427,-5816.347,239.6109,0,0,0,0,100,0),
(@PATH,72,2273.927,-5816.347,239.3609,0,0,0,0,100,0),
(@PATH,73,2268.927,-5816.347,238.6109,0,0,0,0,100,0),
(@PATH,74,2265.927,-5816.347,238.1109,0,0,0,0,100,0),
(@PATH,75,2263.177,-5816.347,237.3609,0,0,0,0,100,0),
(@PATH,76,2260.177,-5816.347,236.8609,0,0,0,0,100,0),
(@PATH,77,2257.177,-5816.097,236.1109,0,0,0,0,100,0),
(@PATH,78,2254.177,-5816.097,235.6109,0,0,0,0,100,0),
(@PATH,79,2252.177,-5816.097,234.8609,0,0,0,0,100,0),
(@PATH,80,2251.755,-5816.022,234.7061,0,0,0,0,100,0),
(@PATH,81,2251.255,-5816.022,234.4561,0,0,0,0,100,0),
(@PATH,82,2249.005,-5819.272,233.9561,0,0,0,0,100,0),
(@PATH,83,2245.755,-5823.022,233.4561,0,0,0,0,100,0),
(@PATH,84,2237.505,-5833.772,232.7061,0,0,0,0,100,0),
(@PATH,85,2237.158,-5834.125,232.8664,0,0,0,0,100,0),
(@PATH,86,2235.658,-5835.875,232.8664,0,0,0,0,100,0),
(@PATH,87,2233.408,-5839.375,233.3664,0,0,0,0,100,0),
(@PATH,88,2232.408,-5840.875,234.1164,0,0,0,0,100,0),
(@PATH,89,2219.158,-5860.625,234.6164,0,0,0,0,100,0);

SET @NPC := 120149;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2262.334,`position_y`=-5751.438,`position_z`=235.7999 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2262.334,-5751.438,235.7999,0,0,0,0,100,0),
(@PATH,2,2265.334,-5751.688,236.2999,0,0,0,0,100,0),
(@PATH,3,2268.334,-5751.688,236.7999,0,0,0,0,100,0),
(@PATH,4,2272.334,-5751.938,237.2999,0,0,0,0,100,0),
(@PATH,5,2276.084,-5751.938,237.7999,0,0,0,0,100,0),
(@PATH,6,2281.084,-5752.188,238.5499,0,0,0,0,100,0),
(@PATH,7,2285.119,-5752.452,239.3618,0,0,0,0,100,0),
(@PATH,8,2290.119,-5751.702,239.8618,0,0,0,0,100,0),
(@PATH,9,2293.119,-5751.202,240.6118,0,0,0,0,100,0),
(@PATH,10,2296.869,-5750.952,241.3618,0,0,0,0,100,0),
(@PATH,11,2298.869,-5750.702,242.1118,0,0,0,0,100,0),
(@PATH,12,2300.619,-5750.452,242.8618,0,0,0,0,100,0),
(@PATH,13,2302.619,-5750.202,243.3618,0,0,0,0,100,0),
(@PATH,14,2284.775,-5752.427,238.9423,0,0,0,0,100,0),
(@PATH,15,2280.025,-5752.177,238.1923,0,0,0,0,100,0),
(@PATH,16,2276.025,-5751.927,237.6923,0,0,0,0,100,0),
(@PATH,17,2271.275,-5751.927,237.1923,0,0,0,0,100,0),
(@PATH,18,2267.275,-5751.677,236.6923,0,0,0,0,100,0),
(@PATH,19,2264.275,-5751.677,235.9423,0,0,0,0,100,0),
(@PATH,20,2263.899,-5751.408,235.8208,0,0,0,0,100,0),
(@PATH,21,2262.149,-5751.158,235.3208,0,0,0,0,100,0),
(@PATH,22,2259.899,-5749.408,234.5708,0,0,0,0,100,0),
(@PATH,23,2258.149,-5748.158,234.0708,0,0,0,0,100,0),
(@PATH,24,2255.399,-5745.658,233.5708,0,0,0,0,100,0),
(@PATH,25,2250.649,-5742.158,232.8208,0,0,0,0,100,0),
(@PATH,26,2247.649,-5739.658,232.0708,0,0,0,0,100,0),
(@PATH,27,2245.899,-5738.408,231.3208,0,0,0,0,100,0),
(@PATH,28,2245.635,-5738.067,231.0636,0,0,0,0,100,0),
(@PATH,29,2245.385,-5737.817,231.0636,0,0,0,0,100,0),
(@PATH,30,2242.385,-5737.817,230.3136,0,0,0,0,100,0),
(@PATH,31,2238.385,-5737.817,229.5636,0,0,0,0,100,0),
(@PATH,32,2235.385,-5737.567,228.8136,0,0,0,0,100,0),
(@PATH,33,2232.385,-5737.567,228.5636,0,0,0,0,100,0),
(@PATH,34,2230.385,-5737.317,227.8136,0,0,0,0,100,0),
(@PATH,35,2227.635,-5737.317,227.0636,0,0,0,0,100,0),
(@PATH,36,2223.635,-5737.067,226.5636,0,0,0,0,100,0),
(@PATH,37,2228.52,-5737.324,227.3947,0,0,0,0,100,0),
(@PATH,38,2231.52,-5737.324,228.1447,0,0,0,0,100,0),
(@PATH,39,2233.52,-5737.324,228.6447,0,0,0,0,100,0),
(@PATH,40,2236.52,-5737.324,229.6447,0,0,0,0,100,0),
(@PATH,41,2239.52,-5737.574,230.1447,0,0,0,0,100,0),
(@PATH,42,2244.52,-5737.824,230.8947,0,0,0,0,100,0),
(@PATH,43,2244.827,-5737.938,231.2612,0,0,0,0,100,0),
(@PATH,44,2245.577,-5738.188,231.5112,0,0,0,0,100,0),
(@PATH,45,2247.077,-5739.438,232.0112,0,0,0,0,100,0),
(@PATH,46,2249.577,-5741.188,232.7612,0,0,0,0,100,0),
(@PATH,47,2252.327,-5743.688,233.0112,0,0,0,0,100,0),
(@PATH,48,2256.327,-5746.688,233.7612,0,0,0,0,100,0),
(@PATH,49,2259.577,-5748.938,234.7612,0,0,0,0,100,0),
(@PATH,50,2261.827,-5750.938,235.5112,0,0,0,0,100,0);

DELETE FROM `creature_addon` WHERE `guid` IN (109831, 109828, 109826, 109830,109823, 109825,109824);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(109831,0,0,0,1,234, ''),
(109828,0,0,0,1,234, ''),
(109830,0,0,0,1,234, ''),
(109826,0,0,0,1,234, ''),
(109823,0,0,0,1,234, ''),
(109825,0,0,0,1,234, ''),
(109824,0,0,0,1,234, '');

SET @NPC := 120150;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2128.34,`position_y`=-5658.604,`position_z`=223.8993 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2128.34,-5658.604,223.8993,0,0,0,0,100,0),
(@PATH,2,2125.84,-5654.354,223.1493,0,0,0,0,100,0),
(@PATH,3,2122.84,-5648.354,222.8993,0,0,0,0,100,0),
(@PATH,4,2123.144,-5649.323,222.8194,0,0,0,0,100,0),
(@PATH,5,2126.394,-5655.073,223.3194,0,0,0,0,100,0),
(@PATH,6,2128.553,-5658.948,223.8999,0,0,0,0,100,0),
(@PATH,7,2129.803,-5662.698,224.3999,0,0,0,0,100,0),
(@PATH,8,2134.125,-5675.085,224.4907,0,0,0,0,100,0),
(@PATH,9,2152.488,-5679.756,223.9727,0,0,0,0,100,0),
(@PATH,10,2160.738,-5690.756,224.7227,0,0,0,0,100,0),
(@PATH,11,2163.738,-5694.756,225.2227,0,0,0,0,100,0),
(@PATH,12,2165.899,-5697.549,225.7736,0,0,0,0,100,0),
(@PATH,13,2166.149,-5700.549,226.5236,0,0,0,0,100,0),
(@PATH,14,2166.649,-5704.549,227.0236,0,0,0,0,100,0),
(@PATH,15,2168.59,-5716.993,226.6831,0,0,0,0,100,0),
(@PATH,16,2167.84,-5719.993,225.9331,0,0,0,0,100,0),
(@PATH,17,2167.09,-5722.743,225.1831,0,0,0,0,100,0),
(@PATH,18,2166.59,-5724.743,224.6831,0,0,0,0,100,0),
(@PATH,19,2165.34,-5728.493,224.1831,0,0,0,0,100,0),
(@PATH,20,2164.34,-5732.243,223.4331,0,0,0,0,100,0),
(@PATH,21,2162.84,-5738.993,222.9331,0,0,0,0,100,0),
(@PATH,22,2160.84,-5745.743,222.1831,0,0,0,0,100,0),
(@PATH,23,2162.729,-5739.398,222.9048,0,0,0,0,100,0),
(@PATH,24,2164.229,-5733.648,223.4048,0,0,0,0,100,0),
(@PATH,25,2164.979,-5729.898,224.1548,0,0,0,0,100,0),
(@PATH,26,2165.979,-5726.898,224.4048,0,0,0,0,100,0),
(@PATH,27,2166.729,-5724.148,224.9048,0,0,0,0,100,0),
(@PATH,28,2167.479,-5721.148,225.6548,0,0,0,0,100,0),
(@PATH,29,2167.979,-5719.398,226.1548,0,0,0,0,100,0),
(@PATH,30,2168.548,-5716.782,226.5884,0,0,0,0,100,0),
(@PATH,31,2167.798,-5711.782,227.0884,0,0,0,0,100,0),
(@PATH,32,2166.798,-5703.282,226.5884,0,0,0,0,100,0),
(@PATH,33,2166.048,-5698.282,226.0884,0,0,0,0,100,0),
(@PATH,34,2165.742,-5697.929,225.9924,0,0,0,0,100,0),
(@PATH,35,2165.742,-5697.429,225.7424,0,0,0,0,100,0),
(@PATH,36,2163.242,-5694.179,224.9924,0,0,0,0,100,0),
(@PATH,37,2160.242,-5690.429,224.4924,0,0,0,0,100,0),
(@PATH,38,2152.176,-5679.611,224.0445,0,0,0,0,100,0),
(@PATH,39,2144.426,-5677.861,224.5445,0,0,0,0,100,0);

SET @NPC := 120152;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2154.159,`position_y`=-5723.996,`position_z`=223.0912 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2154.159,-5723.996,223.0912,0,0,0,0,100,0),
(@PATH,2,2137.623,-5711.125,222.6578,0,0,0,0,100,0),
(@PATH,3,2129.873,-5709.875,221.9078,0,0,0,0,100,0),
(@PATH,4,2119.815,-5707.577,221.3295,0,0,0,0,100,0),
(@PATH,5,2114.065,-5709.077,220.8295,0,0,0,0,100,0),
(@PATH,6,2108.565,-5710.327,220.3295,0,0,0,0,100,0),
(@PATH,7,2101.43,-5712.379,219.8378,0,0,0,0,100,0),
(@PATH,8,2099.93,-5717.379,219.8378,0,0,0,0,100,0),
(@PATH,9,2098.93,-5718.379,219.5878,0,0,0,0,100,0),
(@PATH,10,2098.18,-5720.129,219.8378,0,0,0,0,100,0),
(@PATH,11,2097.43,-5720.879,219.8378,0,0,0,0,100,0),
(@PATH,12,2094.14,-5721.884,220.084,0,0,0,0,100,0),
(@PATH,13,2092.64,-5726.134,220.084,0,0,0,0,100,0),
(@PATH,14,2091.89,-5726.134,220.084,0,0,0,0,100,0),
(@PATH,15,2087.875,-5731.934,220.9643,0,0,0,0,100,0),
(@PATH,16,2092.625,-5745.934,221.2143,0,0,0,0,100,0),
(@PATH,17,2094.375,-5750.684,221.9643,0,0,0,0,100,0),
(@PATH,18,2095.442,-5753.201,222.3668,0,0,0,0,100,0),
(@PATH,19,2104.192,-5759.951,223.1168,0,0,0,0,100,0),
(@PATH,20,2119.141,-5770.843,222.4777,0,0,0,0,100,0),
(@PATH,21,2124.141,-5769.843,222.2277,0,0,0,0,100,0),
(@PATH,22,2131.641,-5768.343,221.4777,0,0,0,0,100,0),
(@PATH,23,2140.391,-5766.593,222.2277,0,0,0,0,100,0),
(@PATH,24,2140.742,-5766.548,221.9879,0,0,0,0,100,0),
(@PATH,25,2142.742,-5766.048,222.2379,0,0,0,0,100,0),
(@PATH,26,2151.492,-5753.048,221.4879,0,0,0,0,100,0),
(@PATH,27,2155.317,-5747.127,221.8537,0,0,0,0,100,0),
(@PATH,28,2154.817,-5738.127,222.1037,0,0,0,0,100,0),
(@PATH,29,2154.317,-5729.377,222.8537,0,0,0,0,100,0);

SET @NPC := 120137;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2075.252,`position_y`=-5716.352,`position_z`=220.4356 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2075.252,-5716.352,220.4356,0,0,0,0,100,0),
(@PATH,2,2070.502,-5707.852,219.9356,0,0,0,0,100,0),
(@PATH,3,2069.502,-5705.852,220.1856,0,0,0,0,100,0),
(@PATH,4,2070.526,-5706.426,220.133,0,0,0,0,100,0),
(@PATH,5,2065.526,-5702.926,219.883,0,0,0,0,100,0),
(@PATH,6,2065.026,-5702.426,219.883,0,0,0,0,100,0),
(@PATH,7,2064.776,-5701.676,219.883,0,0,0,0,100,0),
(@PATH,8,2065.526,-5700.176,219.883,0,0,0,0,100,0),
(@PATH,9,2060.776,-5693.676,219.633,0,0,0,0,100,0),
(@PATH,10,2060.422,-5693.571,219.6252,0,0,0,0,100,0),
(@PATH,11,2058.672,-5693.071,219.6252,0,0,0,0,100,0),
(@PATH,12,2047.04,-5682.255,219.5401,0,0,0,0,100,0),
(@PATH,13,2042.04,-5678.005,219.2901,0,0,0,0,100,0),
(@PATH,14,2041.632,-5678.002,219.3048,0,0,0,0,100,0),
(@PATH,15,2039.632,-5677.252,219.3048,0,0,0,0,100,0),
(@PATH,16,2037.132,-5678.252,219.3048,0,0,0,0,100,0),
(@PATH,17,2035.882,-5678.752,219.0548,0,0,0,0,100,0),
(@PATH,18,2033.632,-5678.002,219.0548,0,0,0,0,100,0),
(@PATH,19,2029.16,-5686.224,218.986,0,0,0,0,100,0),
(@PATH,20,2023.726,-5703.316,219.4464,0,0,0,0,100,0),
(@PATH,21,2022.476,-5714.066,219.9464,0,0,0,0,100,0),
(@PATH,22,2022.648,-5712.915,219.7182,0,0,0,0,100,0),
(@PATH,23,2024.124,-5703.091,219.3032,0,0,0,0,100,0),
(@PATH,24,2029.471,-5685.995,219.0933,0,0,0,0,100,0),
(@PATH,25,2033.471,-5681.245,219.0933,0,0,0,0,100,0),
(@PATH,26,2037.471,-5681.245,219.0933,0,0,0,0,100,0),
(@PATH,27,2038.221,-5679.495,219.3433,0,0,0,0,100,0),
(@PATH,28,2038.521,-5679.581,219.3637,0,0,0,0,100,0),
(@PATH,29,2039.521,-5677.831,219.3637,0,0,0,0,100,0),
(@PATH,30,2040.771,-5678.081,219.1137,0,0,0,0,100,0),
(@PATH,31,2042.021,-5678.081,219.3637,0,0,0,0,100,0),
(@PATH,32,2075.252,-5716.352,220.4356,0,0,0,0,100,0);

SET @NPC := 120147;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2102.03,`position_y`=-5800.944,`position_z`=223.819 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2102.03,-5800.944,223.819,0,0,0,0,100,0),
(@PATH,2,2080.937,-5796.923,223.4334,0,0,0,0,100,0),
(@PATH,3,2074.937,-5792.173,222.6834,0,0,0,0,100,0),
(@PATH,4,2065.619,-5785.093,222.6266,0,0,0,0,100,0),
(@PATH,5,2051.119,-5782.343,222.8766,0,0,0,0,100,0),
(@PATH,6,2046.524,-5781.284,223.3339,0,0,0,0,100,0),
(@PATH,7,2029.024,-5777.534,222.8339,0,0,0,0,100,0),
(@PATH,8,2033.789,-5778.684,223.2256,0,0,0,0,100,0),
(@PATH,9,2046.719,-5781.6,223.3394,0,0,0,0,100,0),
(@PATH,10,2053.469,-5782.85,222.5894,0,0,0,0,100,0),
(@PATH,11,2065.735,-5785.408,222.6681,0,0,0,0,100,0),
(@PATH,12,2074.985,-5792.408,222.9181,0,0,0,0,100,0),
(@PATH,13,2081.066,-5797.328,223.2618,0,0,0,0,100,0),
(@PATH,14,2095.566,-5799.828,224.0118,0,0,0,0,100,0),
(@PATH,15,2102.262,-5800.976,223.6565,0,0,0,0,100,0),
(@PATH,16,2120.868,-5798.317,223.4864,0,0,0,0,100,0),
(@PATH,17,2134.618,-5811.067,223.7364,0,0,0,0,100,0),
(@PATH,18,2134.876,-5811.295,224.1177,0,0,0,0,100,0),
(@PATH,19,2136.126,-5812.795,224.1177,0,0,0,0,100,0),
(@PATH,20,2140.126,-5818.545,224.8677,0,0,0,0,100,0),
(@PATH,21,2142.876,-5822.295,225.3677,0,0,0,0,100,0),
(@PATH,22,2145.626,-5826.545,226.1177,0,0,0,0,100,0),
(@PATH,23,2148.376,-5830.545,226.6177,0,0,0,0,100,0),
(@PATH,24,2148.635,-5830.768,226.9688,0,0,0,0,100,0),
(@PATH,25,2149.135,-5831.268,226.9688,0,0,0,0,100,0),
(@PATH,26,2150.635,-5835.018,227.2188,0,0,0,0,100,0),
(@PATH,27,2155.635,-5847.768,227.9688,0,0,0,0,100,0),
(@PATH,28,2154.901,-5846.021,227.5791,0,0,0,0,100,0),
(@PATH,29,2149.901,-5833.271,227.3291,0,0,0,0,100,0),
(@PATH,30,2149.71,-5833.156,227.0473,0,0,0,0,100,0),
(@PATH,31,2148.71,-5830.906,226.7973,0,0,0,0,100,0),
(@PATH,32,2145.46,-5826.156,226.0473,0,0,0,0,100,0),
(@PATH,33,2143.71,-5823.656,225.5473,0,0,0,0,100,0),
(@PATH,34,2140.96,-5819.656,225.0473,0,0,0,0,100,0),
(@PATH,35,2138.21,-5815.656,224.5473,0,0,0,0,100,0),
(@PATH,36,2136.034,-5812.465,224.0105,0,0,0,0,100,0),
(@PATH,37,2130.034,-5806.965,223.5105,0,0,0,0,100,0),
(@PATH,38,2120.728,-5798.307,223.3551,0,0,0,0,100,0),
(@PATH,39,2102.076,-5801.051,223.8351,0,0,0,0,100,0);

SET @NPC := 120136;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2080.225,`position_y`=-5589.215,`position_z`=221.3878 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2080.225,-5589.215,221.3878,0,0,0,0,100,0),
(@PATH,2,2081.975,-5593.715,220.6378,0,0,0,0,100,0),
(@PATH,3,2083.975,-5599.465,220.3878,0,0,0,0,100,0),
(@PATH,4,2089.191,-5614.264,220.0699,0,0,0,0,100,0),
(@PATH,5,2096.053,-5639.193,220.6267,0,0,0,0,100,0),
(@PATH,6,2100.053,-5639.443,221.1267,0,0,0,0,100,0),
(@PATH,7,2104.053,-5639.693,221.6267,0,0,0,0,100,0),
(@PATH,8,2117.312,-5640.561,221.1541,0,0,0,0,100,0),
(@PATH,9,2112.312,-5640.311,221.6541,0,0,0,0,100,0),
(@PATH,10,2100.562,-5639.811,221.1541,0,0,0,0,100,0),
(@PATH,11,2097.562,-5639.561,220.9041,0,0,0,0,100,0),
(@PATH,12,2097.3,-5639.193,220.5651,0,0,0,0,100,0),
(@PATH,13,2096.05,-5639.193,220.3151,0,0,0,0,100,0),
(@PATH,14,2094.55,-5634.443,220.0651,0,0,0,0,100,0),
(@PATH,15,2089.009,-5613.948,220.2999,0,0,0,0,100,0),
(@PATH,16,2082.009,-5594.448,220.5499,0,0,0,0,100,0),
(@PATH,17,2080.509,-5589.698,221.2999,0,0,0,0,100,0),
(@PATH,18,2080.143,-5589.684,221.4837,0,0,0,0,100,0),
(@PATH,19,2079.893,-5588.934,221.7337,0,0,0,0,100,0),
(@PATH,20,2076.143,-5581.684,222.2337,0,0,0,0,100,0),
(@PATH,21,2071.212,-5571.433,222.7248,0,0,0,0,100,0),
(@PATH,22,2073.462,-5562.183,221.7248,0,0,0,0,100,0),
(@PATH,23,2074.686,-5557.151,221.2854,0,0,0,0,100,0),
(@PATH,24,2069.488,-5540.957,221.5191,0,0,0,0,100,0),
(@PATH,25,2061.988,-5530.707,221.7691,0,0,0,0,100,0),
(@PATH,26,2064.464,-5534.364,221.5207,0,0,0,0,100,0),
(@PATH,27,2069.663,-5541.201,221.3927,0,0,0,0,100,0),
(@PATH,28,2074.632,-5557.394,221.5371,0,0,0,0,100,0),
(@PATH,29,2073.132,-5562.894,222.0371,0,0,0,0,100,0),
(@PATH,30,2071.13,-5571.828,222.6939,0,0,0,0,100,0),
(@PATH,31,2077.38,-5583.828,221.6939,0,0,0,0,100,0),
(@PATH,32,2080.168,-5589.105,221.3963,0,0,0,0,100,0),
(@PATH,33,2081.918,-5593.855,220.6463,0,0,0,0,100,0),
(@PATH,34,2083.918,-5599.355,220.3963,0,0,0,0,100,0);

SET @NPC := 120151;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2142.654,`position_y`=-5556.986,`position_z`=225.6937 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2142.654,-5556.986,225.6937,0,0,0,0,100,0),
(@PATH,2,2142.904,-5557.986,225.4437,0,0,0,0,100,0),
(@PATH,3,2145.654,-5560.986,225.1937,0,0,0,0,100,0),
(@PATH,4,2142.755,-5558.065,225.3596,0,0,0,0,100,0),
(@PATH,5,2142.851,-5557.728,225.8659,0,0,0,0,100,0),
(@PATH,6,2141.101,-5554.228,226.6159,0,0,0,0,100,0),
(@PATH,7,2140.601,-5552.478,227.1159,0,0,0,0,100,0),
(@PATH,8,2139.601,-5549.728,227.8659,0,0,0,0,100,0),
(@PATH,9,2138.101,-5545.978,228.6159,0,0,0,0,100,0),
(@PATH,10,2137.798,-5545.773,228.9405,0,0,0,0,100,0),
(@PATH,11,2136.798,-5543.773,229.4405,0,0,0,0,100,0),
(@PATH,12,2135.798,-5541.023,229.6905,0,0,0,0,100,0),
(@PATH,13,2134.548,-5537.023,230.4405,0,0,0,0,100,0),
(@PATH,14,2131.298,-5528.023,230.9405,0,0,0,0,100,0),
(@PATH,15,2129.448,-5523.198,231.5357,0,0,0,0,100,0),
(@PATH,16,2126.948,-5518.948,232.2857,0,0,0,0,100,0),
(@PATH,17,2121.149,-5509.625,231.9573,0,0,0,0,100,0),
(@PATH,18,2119.649,-5507.125,231.4573,0,0,0,0,100,0),
(@PATH,19,2112.399,-5494.375,231.9573,0,0,0,0,100,0),
(@PATH,20,2112.38,-5494.367,231.9073,0,0,0,0,100,0),
(@PATH,21,2116.13,-5500.867,231.4073,0,0,0,0,100,0),
(@PATH,22,2121.361,-5509.888,231.6478,0,0,0,0,100,0),
(@PATH,23,2123.611,-5513.388,232.3978,0,0,0,0,100,0),
(@PATH,24,2127.861,-5520.638,231.6478,0,0,0,0,100,0),
(@PATH,25,2129.729,-5523.562,231.5181,0,0,0,0,100,0);

SET @NPC := 120142;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2079.262,`position_y`=-5562.862,`position_z`=222.2908 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2079.262,-5562.862,222.2908,0,0,0,0,100,0),
(@PATH,2,2072.012,-5582.112,222.0408,0,0,0,0,100,0),
(@PATH,3,2071.887,-5582.362,221.7679,0,0,0,0,100,0),
(@PATH,4,2071.387,-5584.362,221.7679,0,0,0,0,100,0),
(@PATH,5,2077.887,-5592.612,221.0179,0,0,0,0,100,0),
(@PATH,6,2080.637,-5595.612,220.7679,0,0,0,0,100,0),
(@PATH,7,2083.449,-5599.147,220.1104,0,0,0,0,100,0),
(@PATH,8,2081.201,-5606.92,219.7044,0,0,0,0,100,0),
(@PATH,9,2083.427,-5599.123,220.4243,0,0,0,0,100,0),
(@PATH,10,2079.427,-5594.373,220.6743,0,0,0,0,100,0),
(@PATH,11,2076.927,-5591.623,221.1743,0,0,0,0,100,0),
(@PATH,12,2071.344,-5584.12,221.8966,0,0,0,0,100,0),
(@PATH,13,2073.344,-5578.37,222.3966,0,0,0,0,100,0),
(@PATH,14,2079.698,-5562.533,222.5299,0,0,0,0,100,0),
(@PATH,15,2086.698,-5553.283,223.2799,0,0,0,0,100,0),
(@PATH,16,2088.698,-5551.033,223.7799,0,0,0,0,100,0),
(@PATH,17,2091.198,-5547.783,224.7799,0,0,0,0,100,0),
(@PATH,18,2090.645,-5548.484,224.2913,0,0,0,0,100,0),
(@PATH,19,2088.145,-5551.734,223.5413,0,0,0,0,100,0),
(@PATH,20,2086.395,-5553.984,223.0413,0,0,0,0,100,0),
(@PATH,21,2079.382,-5562.914,222.5029,0,0,0,0,100,0),
(@PATH,22,2071.882,-5582.164,222.0029,0,0,0,0,100,0);

SET @NPC := 120140;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1922.999,`position_y`=-5645.25,`position_z`=215.718 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1922.999,-5645.25,215.718,0,0,0,0,100,0),
(@PATH,2,1933.499,-5635,216.218,0,0,0,0,100,0),
(@PATH,3,1937.249,-5631.75,216.718,0,0,0,0,100,0),
(@PATH,4,1937.389,-5631.363,216.962,0,0,0,0,100,0),
(@PATH,5,1938.389,-5630.613,217.462,0,0,0,0,100,0),
(@PATH,6,1939.139,-5628.863,217.962,0,0,0,0,100,0),
(@PATH,7,1940.889,-5625.363,218.462,0,0,0,0,100,0),
(@PATH,8,1942.889,-5622.113,219.212,0,0,0,0,100,0),
(@PATH,9,1944.389,-5619.613,219.712,0,0,0,0,100,0),
(@PATH,10,1943.933,-5620.388,219.5658,0,0,0,0,100,0),
(@PATH,11,1942.183,-5623.638,218.8158,0,0,0,0,100,0),
(@PATH,12,1940.683,-5626.138,218.3158,0,0,0,0,100,0),
(@PATH,13,1938.933,-5629.638,217.5658,0,0,0,0,100,0),
(@PATH,14,1938.662,-5629.795,217.488,0,0,0,0,100,0),
(@PATH,15,1937.912,-5630.795,217.238,0,0,0,0,100,0),
(@PATH,16,1935.162,-5633.545,216.488,0,0,0,0,100,0),
(@PATH,17,1931.412,-5636.795,216.238,0,0,0,0,100,0),
(@PATH,18,1922.758,-5645.203,215.613,0,0,0,0,100,0),
(@PATH,19,1909.855,-5639.054,216.2815,0,0,0,0,100,0),
(@PATH,20,1902.855,-5639.054,216.5315,0,0,0,0,100,0),
(@PATH,21,1899.105,-5639.054,217.0315,0,0,0,0,100,0),
(@PATH,22,1892.578,-5638.81,217.5839,0,0,0,0,100,0),
(@PATH,23,1892.559,-5638.872,217.3643,0,0,0,0,100,0),
(@PATH,24,1892.922,-5638.996,217.5783,0,0,0,0,100,0),
(@PATH,25,1900.672,-5638.996,216.8283,0,0,0,0,100,0),
(@PATH,26,1904.672,-5638.996,216.5783,0,0,0,0,100,0),
(@PATH,27,1910.292,-5639.049,215.9298,0,0,0,0,100,0);
