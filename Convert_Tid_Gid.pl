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

my $input1 = <$ARGV[1]>; # Input Chimps Genome File 
open (IN1, $input1) || die "Cannot opent he file1\n";
my $chimps = {};
while (chomp(my $line1 = <IN1>))
{
#>ENSPTRT00000098376.1 cdna scaffold:Pan_tro_3.0:KV420933.1:136402:136755:1 gene:ENSPTRG00000052620.1 gene_biotype:TR_V_gene transcript_biotype:TR_V_gene
if ($line1 =~ /^>/)
	{
		my @arr = split(" ", $line1);
		my $tid = $arr[0];
		$tid =~ s/>//g;
		my $id = $arr[3];
		my @arr1 = split(":", $id);
        my $gid = $arr1[1];
		my @new = split(/\./, $gid);
		my $neweid = $new[0];
		$chimps->{$tid}=$neweid;
	}
}

my $input2 = <$ARGV[2]>; # Input Gorilla Genome File 
open (IN2, $input2) || die "Cannot opent he file1\n";
my $gorilla = {};
while (chomp(my $line2 = <IN2>))
{
#>ENSGGOT00000048834.1 cdna chromosome:gorGor4:7:142109302:142109637:1 gene:ENSGGOG00000038962.1 gene_biotype:TR_V_gene transcript_biotype:TR_V_gene
if ($line2 =~ /^>/)
	{
		my @arr = split(" ", $line2);
		my $tid = $arr[0];
		$tid =~ s/>//g;
		my $id = $arr[3];
		my @arr1 = split(":", $id);
        my $gid = $arr1[1];
		my @new = split(/\./, $gid);
		my $neweid = $new[0];
		$gorilla->{$tid}=$neweid;
	}
}

#---- Now Input your Kallisto Output files having expression level of each transcripts

my $input3 = <$ARGV[3]>;
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
	if (exists ($chimps->{$hid}))
	{
		print OUT $chimps->{$hid}."\t"."$line3"."\n";
	}
	if (exists ($gorilla->{$hid}))
	{
		print OUT $gorilla->{$hid}."\t"."$line3"."\n";
	}
}


