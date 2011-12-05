<?
/*
This file is part of the 'Pg2MySQL' converter project
http://www.lightbox.org/pg2mysql.php

Copyright (C) 2005-2006 James Grant <james@lightbox.org>

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


function getfieldname($l)
{
	//first check if its in nice quotes for us
	if(ereg("`(.*)`",$l,$regs))
	{
		if($regs[1])
			return $regs[1];
		else
			return null;
	}
	//if its not in quotes, then it should (we hope!) be the first "word" on the line, up to the first space.
	else if(ereg("([^\ ]*)",trim($l),$regs))
	{
		if($regs[1])
			return $regs[1];
		else
			return null;
	}
}

function pg2mysql($input)
{
	$lines=explode("\n",$input);
	$output="";
	if(substr($lines[0],-1)=="\r")
	{
		//  Lines have \n\r termination - from web
		$ssoff = -3;
		$sslen = -1;
	}
	else
	{
		//  Lines have no \r - file input
		$ssoff = -2;
		$sslen = 2;
	}

	$in_create_table=false;

	$linenumber=0;
	$tbl_extra="";
	while(isset($lines[$linenumber]))
	{
		$line=$lines[$linenumber];
		if(substr($line,0,12)=="CREATE TABLE")
		{
			$in_create_table=true;
			$line=str_replace("\"","`",$line);
			$output.=$line;
			$linenumber++;
			continue;
		}

		if(substr($line,0,2)==");" && $in_create_table)
		{
			$in_create_table=false;
			$line=") TYPE=MyISAM;\n\n";

			$output.=$tbl_extra;
			$output.=$line;

			$linenumber++;
			$tbl_extra="";
			continue;
		}

		if($in_create_table)
		{
			$line=str_replace("\"","`",$line);
			$line=str_replace(" integer"," int(11)",$line);
			$line=str_replace(" serial"," int(11) auto_increment",$line);
			$line=str_replace(" bytea"," BLOB",$line);
			$line=str_replace(" boolean"," bool",$line);
			$line=str_replace(" bool DEFAULT true"," bool DEFAULT 1",$line);
			$line=str_replace(" bool DEFAULT false"," bool DEFAULT 0",$line);
			if(ereg(" character varying\(([0-9]*)\)",$line,$regs))
			{
				$num=$regs[1];
				if($num<=255)
					$line=ereg_replace(" character varying\([0-9]*\)"," varchar($num)",$line);
				else
					$line=ereg_replace(" character varying\([0-9]*\)"," text",$line);
			}
			//character varying with no size, we will default to varchar(255)
			if(ereg(" character varying",$line))
			{
				$line=ereg_replace(" character varying"," varchar(255)",$line);
			}

			$line=ereg_replace(" DEFAULT nextval\(.*\) "," auto_increment ",$line);
			$line=ereg_replace("::.*,",",",$line);
			$line=ereg_replace("::.*$","\n",$line);
			if(ereg("character\(([0-9]*)\)",$line,$regs))
			{
				$num=$regs[1];
				if($num<=255)
					$line=ereg_replace(" character\([0-9]*\)"," varchar($num)",$line);
				else
					$line=ereg_replace(" character\([0-9]*\)"," text",$line);
			}
			//timestamps
			$line=str_replace(" timestamp with time zone"," timestamp",$line);
			$line=str_replace(" timestamp without time zone"," timestamp",$line);

			//time
			$line=str_replace(" time with time zone"," time",$line);
			$line=str_replace(" time without time zone"," time",$line);

			$line=str_replace(" timestamp DEFAULT now()"," timestamp DEFAULT CURRENT_TIMESTAMP",$line);

			if(strstr($line,"auto_increment"))
			{
				$field=getfieldname($line);
				$tbl_extra.=", PRIMARY KEY(`$field`)\n";
			}



			$output.=$line;
		}

		if(substr($line,0,11)=="INSERT INTO")
		{
			if(substr($line,$ssoff,$sslen)==");")
			{
				//we have a complete insert on one line
				$line=str_replace("\"","`",$line);
				$output.=$line;
				$linenumber++;
				continue;
			}
			else
			{
				//this insert spans multiple lines, so keep dumping the lines until we reach a line
				//that ends with  ");"
				$line=str_replace("\"","`",$line);
				$output.=$line;
				do{
					$linenumber++;
					$output.=$lines[$linenumber];
				} while(substr($lines[$linenumber],$ssoff,$sslen)!=");" && isset($lines[$linenumber]));
			}
		}
		$linenumber++;
	}
	return $output;
}

?>
