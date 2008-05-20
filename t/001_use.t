#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';

use FindBin qw($Bin);

use Path::Class;

my $lib = dir($Bin)->parent->subdir("lib");

my @packages;

$lib->recurse( callback => sub {
	my $file = shift;

	if ( -f $file and $file =~ /\.pm$/ ) {
		my $rel = $file->relative($lib);
		( my $base = $rel->basename ) =~ s/\.pm$//;
		push @packages, join("::", $rel->dir->dir_list, $base);
	}
});

foreach my $pkg ( @packages ) {
	use_ok($pkg);
}

