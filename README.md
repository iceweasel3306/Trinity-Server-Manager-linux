-bash-linux-TrinityCore-Server-Manager
======================================
    Copyright (c)2015 Iceweasel3306

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
Bash scripts coded for debian distros, but can be adapted for others.  The project was specifically made to control a TrinityCore server.
The tools included in the project consist of:
- A Main menu (trinity), this menu allows easy navigation and use of the other tools.
- Two different startup styles, one for service checking and one for a quick startup to start your TrinityCore Server.  Both styles start the server in screen daemons for easy management.
- A seperate service check that can be performed outside of the startup scripts.
- An account manager that includes account creation, password updating, and account deletion
- A default rank permissioning manager **Not finished**
- A server configuration manager **TODO**
- A restarter with crash info gathering tools that runs in the background
- built into the main menu are ways to easily attach and detach in the server daemons
- A quick access to MySQL command line
- All tools/modules/scripts include extensive logging for debug and security purposes
- A configurable file to adjust to your file directory.

I am looking to continually update this project weekly until it is something I'm proud to have made.  Please feel free to contact me with ideas, requests, and friendly pointers.