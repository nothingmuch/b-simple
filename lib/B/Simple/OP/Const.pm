#!/usr/bin/perl

package B::Simple::OP::Const;
use Moose;

use B::Simple::Util;

use namespace::clean;

with 'B::Simple::OP::Nullary';

sub new_from_op {
	my ( $class, $op, @args ) = @_;

	$class->new(
		sv => $op->sv->object_2svref, # FIXME ValueContainer
		@args,
	);
}

has sv => (
	isa => "ScalarRef",
	is => "rw",
);

sub inner_equals {
	my ( $self, $other, @args ) = @_;

	# FIXME args should be able to override value comparsions

	return 1; # FIXME
}

__PACKAGE__

__END__

=pod

=head1 NAME

B::Simple::OP::Const - 

=head1 SYNOPSIS

	use B::Simple::OP::Const;

=head1 DESCRIPTION

=cut


