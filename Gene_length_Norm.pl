#!/usr/bin/perl -w

#-- This program is to normalize Gene counts by the lenght of the gene
#-- Gene counts were obtained after mapping reads to the CAZymes database
#-- Author: Ashok K. Sharma; 24 Aug 2020;

use strict;
use Data::Dumper;

my $input = <$ARGV[0]>; # Input CAZymes database file
open (IN, $input) || die "Cannot opent he file1\n";
my $Glength = {};
while (chomp(my $line = <IN>))
{
#>AAL35364.1|AA0
#HDCFVQGCDASILISGSGTERTAPPNSLLRGYEVIDDAKQQIEAICPGVVSCADILESDQKLWTDDSTKVFIQRYLGLRGFLGLRFGVEFGRSMVKMSNIEVKTGTNGEIRKVCSAIN
		if ($line =~ /^>/)
        {
            chomp(my $line1 = <IN>);
            my @arr = split (/\|/, $line);
            my $gname = $arr[0];
            $gname =~ s/>//;
            my $len =  length($line1);
            $Glength->{$gname}=$len;
        }
}
#print Dumper $Glength;

my $input1 = <$ARGV[1]>; # Input Gene count table
open (IN1, $input1) || die "Cannot opent he file1\n";
open (OUT, ">$input1.LenghtNorm.txt") || die "Can't open the file:\n";
while (chomp(my $line1 = <IN1>))
{
        if ($line1 =~ /^Gene/)
        { print OUT "$line1\n";}
        else
        {
            my @arr1 = split ("\t", "$line1");
            my $gname = shift (@arr1);
            print OUT "$gname";
            foreach my $k (@arr1)
            {
                my $Fraction = $k/$Glength->{$gname};
                my $rounded = sprintf ("%.4f", $Fraction);
                print OUT "\t$rounded";
            }
        print OUT "\n";  
        }
}