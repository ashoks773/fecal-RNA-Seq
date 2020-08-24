#!/usr/bin/perl -w
# This script is to calcuate the cumulative CAZy abundances from the Gene counts table (normalized by Gene lenght)
#-- Author: Ashok K. Sharma; 24 Aug 2020;

use strict;
use Data::Dumper;

my $infile = <$ARGV[0]>; # CAZy database to store the CAZymes for each gene (CAZyDB.07202017.cdhit.fa)
open (IN, $infile) || die;
my $hash = {}; my $hash2 = {};
while (chomp(my $line = <IN>))
{
	#>ABM37370.1|GT51
	if ($line =~ /^>/)
	{
		my @x = split (/\|/, $line);
		my $cazy = $x[1];
		my $gene_ID = $x[0];
		$gene_ID =~ s/>//g;
		$hash->{$gene_ID}->{'CAZy'}=$cazy;
	}
}
#print Dumper $hash;

my $Gene_abundance_file = <$ARGV[1]>; #- This is length normalized gene abundance file (Gene_count_table.txt.LenghtNorm.txt)
open (GENE_ABUNDANCE, $Gene_abundance_file) || die "Cannot open the file\n";

my @v;
while (chomp(my $line2 = <GENE_ABUNDANCE>))
{
        if ($line2 =~ /^Gene/)
        {
                @v = split ("\t", $line2);
                shift (@v);
                next
        }
        else {
                my @t = split ("\t", $line2);
                my $GENE_id = $t[0];
                if (exists($hash->{$GENE_id}->{'CAZy'}))
                {
                        shift(@t);
                        foreach my $v(@v)
                        {
								$hash2->{$hash->{$GENE_id}->{'CAZy'}}->{$v}+=$t[0];
                                shift (@t);
                        }
                }

}
}
open (OUT, ">CAZy_abundance.txt") || die "Cannot open the file\n";
unshift (@v, "CAZy");
my $Header = join ("\t", @v);

print OUT $Header."\n";
shift (@v);

foreach my $r  (keys %{$hash2})
{
        print OUT $r;
        foreach my $v (@v)
        {
                print OUT "\t".$hash2->{$r}->{$v};
        }
        print OUT "\n";
}