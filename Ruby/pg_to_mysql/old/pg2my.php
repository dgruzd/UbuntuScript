#!/usr/bin/php5
<?php
/*
This file is part of the 'Pg2MySQL' converter project
http://www.lightbox.org/pg2mysql.php

Copyright (C) 2005-2006 James Grant <james@lightbox.org>
Copyright (C) 2007 Lindsay Harris <lindsay@bluegum.com> (this file only)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public
License as published by the Free Software Foundation, version 2.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.
*/

/*
 *   This program reads the output from pg_dump from standard input
 *  and performs syntactical changes to conform with mysql format
 *  onto standard output.
 */

//  Include the appropriate function.

include 'pg2mysql.inc.php';

$in = file_get_contents( 'php://stdin' );

$out = pg2mysql( $in );

//  Output contains no newline characters, so insert them here.
file_put_contents( 'php://stdout', str_replace( ";", ";\n",  $out ) );

exit( 0 );
?>
