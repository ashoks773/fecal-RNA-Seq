#!/usr/bin/perl -w

#-- This program is to convert Chimps and Gorilla gene IDs with Human orthologus GeneIDs
#-- Author: Ashok K. Sharma; 10 July 2020;

use strict;
use Data::Dumper;

my $input = <$ARGV[0]>; # Input Orthologus gene file
open (IN, $input) || die "Cannot opent he file1\n";
my $chimps = {};
my $gorilla={};
my $human = {};

while (chomp(my $line = <IN>))
{
#Transcript stable ID version	Gene stable ID	Chimpanzee gene stable ID	Gorilla gene stable ID
#ENST00000000233.10	ENSG00000004059	ENSPTRG00000019651	ENSGGOG00000016749
#ENST00000000412.8	ENSG00000003056	ENSPTRG00000004648	ENSGGOG00000010747
		
	my @arr = split("\t", $line);
	my $gorillaid = $arr[3]; #print $gorillaid; <stdin>;
	$gorillaid =~ s/\r//g;
	my $cid = $arr[2];
	my $hid = $arr[1];

	$gorilla->{$gorillaid}=$arr[1];
	$chimps->{$cid}=$arr[1];
	$human->{$hid}=$arr[1];
}

#print Dumper $gorilla;

#---- Now Input your Kallisto Formatted Files (TID converted to GID using Convert_TiD_GiD.pl)

my $input1 = <$ARGV[1]>; #
open (IN1, $input1) || die "Cannot opent he file1\n";
open (OUT, ">$input1.Othologus.txt") || die "Cannot open the output file\n";

while (chomp(my $line1 = <IN1>))
{		
#GID     target_id       length  eff_length      est_counts      tpm
#ENSPTRG00000052620      ENSPTRT00000098376.1    354     175     0       0

	my @arr1 = split ("\t", $line1);
	my $hid = $arr1[0];	

	if ($line1 =~ /^GID/)
	{
		print OUT "Otho_humanGID\t$line1\n";
	}	
	if (exists ($human->{$hid}))
	{
		print OUT $human->{$hid}."\t"."$line1"."\n";
	}
	if (exists ($chimps->{$hid}))
	{
		print OUT $chimps->{$hid}."\t"."$line1"."\n";
	}
	if (exists ($gorilla->{$hid}))
	{
		print OUT $gorilla->{$hid}."\t"."$line1"."\n";
	}
}


