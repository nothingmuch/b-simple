#!/usr/bin/perl

package B::Simple::OP::Block::AttachedChildren;
use Moose;

with qw(B::Simple::Collection::List::Attached);

sub new_from_floating {
	my ( $class, $floating, @args ) = @_;

	# depending on $args{root} (leavesub, or loop/do) we need to figure out
	# what ops to generate.

	# for subs:
		# if our only child is a nextstate then we generate no scoping ops
		# if we have one additional op we need a lineseq

	# for a do
		# if we have no children we generate a 'scope' with a single 'stub' child
		# if we have one child we generate a 'scope' and a nextstate
		# if we have more than one statement we generate a leave with an enter
		# child, and the list of ops like a lineseq (void ctx)
	
	# for a block (labelable, as in foo: { }, or '{ }'
		# if there is only a nextstate we generate a leaveloop, enterloop, and a stub
		# if there is 1 or more expr we generate a leaveloop, enterloop and a lineseq
		# the loop must know the 'last' (the leaveloop), the 'next' (the loop's
		# leaveloop as well) and 'redo' (the loop's lineseq's first child, a
		# nextstate)
}

__PACKAGE__

__END__

=pod

=head1 NAME

B::Simple::OP::Block::AttachedChildren - 

=head1 SYNOPSIS

	use B::Simple::OP::Block::AttachedChildren;

=head1 DESCRIPTION

=cut


