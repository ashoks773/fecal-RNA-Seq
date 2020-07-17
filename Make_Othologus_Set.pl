#!/usr/bin/perl -w

#-- This program is to convert Transcript IDs to Gene IDs
#-- Author: Ashok K. Sharma; 10 July 2020;

use strict;
use Data::Dumper;
my $hash ={};

my $file = <$ARGV[0]>; # Open Human Chimp Orthologus Genes File Downloaded from MART
open (IF, $file);
while(chomp (my $line = <IF>))
{
#ENSG00000198888	ENSG00000198888.2	ENST00000361390	ENST00000361390.2	ENSPTRG00000042641	MT-ND1	ENSPTRP00000061407	ENSP00000354687
	my @arr = split ("\t", $line);
	$hash->{$arr[3]}=$arr[0]."\t".$arr[4];
}
#print Dumper $hash;

my $file1 = <$ARGV[1]>; # Open Human Gorilla Orthologus Genes File Downloaded from MART
open (IF1, $file1);
open (OF, ">HumanTG_ChimpG_GorillaG.txt");
while (chomp (my $line1 = <IF1>))
{
#ENSG00000198888	ENSG00000198888.2	ENST00000361390	ENST00000361390.2	ENSGGOG00000022681	ENSGGOP00000018398	ND1	
	my @arr1 = split ("\t", $line1);
	if (exists ($hash->{$arr1[3]}))
	{
		print OF $arr1[3]."\t".$hash->{$arr1[3]}."\t".$arr1[4]."\n";
	}
}


