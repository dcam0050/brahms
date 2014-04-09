#________________________________________________________________
#
#	This is the platform-independent makefile for this
#	module. You will need to have UnxUtils installed to
#	make it work on Windoze:
#
#		http://unxutils.sourceforge.net
#________________________________________________________________
#
#	This file is part of BRAHMS
#	Copyright (C) 2007 Ben Mitchinson
#	URL: http://brahms.sourceforge.net
#
#	This program is free software; you can redistribute it and/or
#	modify it under the terms of the GNU General Public License
#	as published by the Free Software Foundation; either version 2
#	of the License, or (at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program; if not, write to the Free Software
#	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#________________________________________________________________
#
#	Subversion Repository Information (automatically updated on commit)
#
#	$Id:: makefile 2392 2009-11-18 16:24:13Z benjmitch         $
#	$Rev:: 2392                                                $
#	$Author:: benjmitch                                        $
#	$Date:: 2009-11-18 16:24:13 +0000 (Wed, 18 Nov 2009)       $
#________________________________________________________________
#



include makefile.brahms



# this file just allows us to add -s (silent) to make calls automatically

default :
	@make -s silent_help

frm :
	@make -s silent_framework

std :
	@make -s silent_std

all :
	@make -s silent_all





silent_help :
	echo make : display this help
	echo make frm {OPTIONS} : make framework
	echo make std {OPTIONS} : make framework, std
	echo make all {OPTIONS} : make framework, components, support
	echo option : NOMPI=1 do not make the MPI layer
	echo option : NOWX=1 do not make components that use WX
	echo option : BUILD=NOOPT do not use optimisation
	echo option : BUILD=DEBUG do debug build
	echo environment : ARCH $(ARCH)

# framework
silent_framework :
	make -C framework -s

# std
silent_std : silent_framework
	make -C components -s std

# all
silent_all : silent_framework
	make -C components -s
	make -C support -s



