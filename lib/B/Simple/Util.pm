#!/usr/bin/perl

package B::Simple::Util;

use strict;
use warnings;

use B ();
use B::Utils ();

use Carp;

use Sub::Exporter -setup => {
	exports => [qw(
		l
	)],
};

sub l ($) {
	my $class = shift;
	Class::MOP::load_class($class) ? $class : croak "Can't load $class";
}

__PACKAGE__

__END__

=pod

=head1 NAME

B::Simple::Util - 

=head1 SYNOPSIS

	use B::Simple::Util;

=head1 DESCRIPTION

=cut


