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

Description:
A collection of tools mostly written in bash designed to help manage a TrinityCore server on a Linux distrubtion operating system.  Bash commands are not needed to operate the Server Manager making use of the tools quick and easy.

The tools included in the project consist of:
- A Main menu (start.sh), this menu allows easy navigation and use of the other tools.
- Two different startup styles, one for service checking and one for a quick startup to start your TrinityCore Server. Both styles start the server in screen daemons for easy management.
- A separate service check that can be performed outside of the startup scripts.
- An account manager that includes account creation, password updating, and account deletion
- A privledged account permission manager (In Progress)
- A server configuration manager that includes easy auth, world, apache, and mysql configuring. (In Progress)
- A backup manager capable of writing full backups of sql servers, apache servers, binaries, and configuration files.  The backup manager can also launch a background process to auto backup at certain times and store/upload selected files.  Sql server backup style is configurable to either a *.sql file or on a seperate db.  All backup files are configured to compress and store locally or via ftp.(TODO)
- A server restarter with crash data gathering tools that runs in the background
- Built into the main menu are ways to easily attach and detach in the server screen daemons.
- A quick access to MySQL command line
- Most tools/modules/scripts include logging procedures for debugging, referencing, and security purposes.
- A configurable file to adjust to your server and machine.

I am looking to continually update this project weekly until it is something I'm proud to have
made. This is in its very early stages, so please forgive me if it does not function as you 
wish it to function. I will work on revising, refining, and organizing the scripts better. 
Please feel free to contact me with ideas, requests, and friendly pointers. Thanks! 