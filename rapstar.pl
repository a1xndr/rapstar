#!/bin/perl
#
# Bling out your github profile by making a few commits here and there
#

use DateTime;

my @pattern = ( # Whatever you want - just make sure there are 7 rows in the matrix
[0,0,0,0,0,0,0,0],
[1,0,0,1,0,0,1,0],
[0,0,1,0,1,0,0,1],
[0,1,0,0,0,1,0,1],
[0,0,0,0,0,0,0,1],
[1,0,0,0,0,0,1,0],
[0,0,0,0,0,0,0,0]
);

my $date = DateTime->new( 
                year   => 2015, 
                month  => 7, 
                day    => 5,    # You probably want this to be a sunday 
                hour   => 10, 
                minute => 30, 
                second => 0, 
                nanosecond => 500000000, 
                time_zone => 'America/New_York' );

my $rows = @pattern;
my $cols = @{$pattern[0]}; # Assuming the number of columns is the same across all rows

for (my $i=0; $i < $cols; $i++) {
    for (my $j=0; $j < $rows; $j++) {
        if($pattern[$j][$i]!=0){
            system("git", "commit", "--allow-empty", "-m", 
                "This commit is literally nothing", "--date", $date  );
        }
        $date->add(days => 1); 
    }
}

