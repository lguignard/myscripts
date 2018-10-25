#!/usr/bin/perl
#
#    <Script to handle Strava data >
#    Copyright (C) 2016  Laurent Guignard<lguignard.debian@gmail.com>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; version 2 of the License
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, 
#    MA 02110-1301 USA
#
use strict;
use warnings;
use Data::Dumper;
use JSON;

my $strava_activities_url="https://www.strava.com/api/v3/activities";
my $strava_auth_url="https://www.strava.com/oauth/authorize";

my $curl_cmd="curl";			# Command to call curl
my $curl_get="GET";				# HTTP command GET
my $curl_post="POST";			# HTTP command POST

#---- 
my $id_client="1280";
my $token="5c6478e2f91cd014aa0ac287adce00d1d328a0e7";

open DATA, $curl_cmd." -X ".$curl_get." -s -d "."access_token=$token -d "."per_page=200 -d after=1451602800". " $strava_activities_url |";
my $output;

while ( defined( my $line = <DATA> )  ) {
	chomp($line);
	$output = $output.$line;
}
close DATA;

#print "\n"; print "\n";
my $json = new JSON;
my @json_activities = $json->decode($output);

#print Dumper(@json_activities);
#print Dumper($json_activities{'id'});

my $nb = $#json_activities;
#print "$nb\n";

#print $json_activities[$nb][-1]{'name'};

my $distance = 0;
my $total_elevation_gain = 0;

foreach my $tab ( $json_activities[$nb] ) {
	foreach my $h ( @$tab ) {
#		print $h->{'name'}."->".$h->{'athlete'}->{'id'}." - ".$h->{'distance'}."\n";
		$distance = $distance+$h->{'distance'};
		$total_elevation_gain = $total_elevation_gain+$h->{'total_elevation_gain'};
		#print Dumper( %$h );
	}
$distance = $distance/1000;

print "Distance totale d'entrainement : $distance"."km\n";
print "Ascension totale à l'entrainement : $total_elevation_gain"."m\n";

}

#print Dumper ( $json_activities[$nb-1] );

