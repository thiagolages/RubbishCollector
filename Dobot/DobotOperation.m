%% Assignment 2

close all;
clear;
clc;

%% Script Begin

% Turn the dobot on and connect it to the computer
% Open a terminal and call roslaunch dobot_magician_driver dobot_magician.launch
    % The dobot will calibrate and move to a "home" location

% In the command window of Matlab, call rosinit('http://localhost:11311')
    % If an error message returns, then call rosshutdown
    % Then call rosinit('http://localhost:11311')

% Sets up the cartesian position of the end-effector
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

% Set home position
cartmsg_.TargetPoints = [0.2, 0, 0, 0];
cartsvc_.call(cartmsg_)

% Move to object
%cartmsg_.TargetPoints = [0.2, 0, -0.04, 0];
cartmsg_.TargetPoints = [0.2, 0, -0.02, 0];
cartsvc_.call(cartmsg_)

suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);

suctioncupmsg_.IsEndEffectorEnabled = 1;
suctioncupmsg_.EndEffectorState = 1;
suctioncupsvc_.call(suctioncupmsg_);

cartmsg_.TargetPoints = [0.25, 0, 1.03, 0];
cartsvc_.call(cartmsg_)

% Pick up object


% Move back to home position with the object
cartmsg_.TargetPoints = [0.2, 0, 0, 0];
cartsvc_.call(cartmsg_)

% Move to intermediate position with object
cartmsg_.TargetPoints = [0.2, 0.2, 0, 0];
cartsvc_.call(cartmsg_)

% Move to drop position with object
cartmsg_.TargetPoints = [0, 0.2, 0.02, 0];
cartsvc_.call(cartmsg_)

pause(7);

% Drop object
suctioncupmsg_.IsEndEffectorEnabled = 0;
suctioncupmsg_.EndEffectorState = 0;
suctioncupsvc_.call(suctioncupmsg_);
