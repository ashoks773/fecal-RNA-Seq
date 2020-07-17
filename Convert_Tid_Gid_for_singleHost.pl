#!/usr/bin/perl -w

#-- This program is to convert Transcript IDs to Gene IDs
#-- Author: Ashok K. Sharma; 10 July 2020;

use strict;
use Data::Dumper;

my $input = <$ARGV[0]>; # Input Human Genome File
open (IN, $input) || die "Cannot opent he file1\n";
my $human = {};
while (chomp(my $line = <IN>))
{
##>ENST00000632684.1 cdna chromosome:GRCh38:7:142786213:142786224:1 gene:ENSG00000282431.1 gene_biotype:TR_D_gene transcript_biotype:TR_D_gene gene_symbol:AC245427.8
#GGGACAGGGGGC
if ($line =~ /^>/)
	{
		my @arr = split(" ", $line);
		my $tid = $arr[0];
		$tid =~ s/>//g;
		my $id = $arr[3];
		my @arr1 = split(":", $id);
        my $gid = $arr1[1];
		my @new = split(/\./, $gid);
		my $neweid = $new[0];
		$human->{$tid}=$neweid;
	}
}

#---- Now Input your Kallisto Output files having expression level of each transcripts

my $input3 = <$ARGV[1]>;
open (IN3, $input3) || die "Cannot opent he file2\n";
open (OUT, ">$input3.Gid.txt") || die "Cannot open the output file\n";

while (chomp(my $line3 = <IN3>))
{		
#target_id       length  eff_length      est_counts      tpm
#ENST00000632684.1       12      2.81731 0       0

	my @arr2 = split ("\t", $line3);
	my $hid = $arr2[0];	

	if ($line3 =~ /^target_id/)
	{
		print OUT "GID\t$line3\n";
	}	
	if (exists ($human->{$hid}))
	{
		print OUT $human->{$hid}."\t"."$line3"."\n";
	}
}


