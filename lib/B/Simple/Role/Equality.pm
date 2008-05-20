package B::Simple::Role::Equality;
use Moose::Role;

# comparison role for any node
# FIXME need to standardize some arguments, for instance for B::OP level
# equality, overriding equality of non optree data embedded in the tree (op_sv,
# for instance), various levels of futz (variable renaming - same variable
# usage but without caring about names, etc)

# generally we want the usage to be "will they run the same" most of the time,
# but sometimes we're interested in "are they exactly the same", "will they
# deparse the same", etc etc.

# Block, for instance, is an abstraction not caring about the type of block it
# is (multiple child statements vs single, sub or loop body) etc. Most o the
# time it should be equals to the same "shape" block even if the context
# changes its actual ops.

sub equals {
	my ( $self, $other, @args ) = @_;

	return unless blessed($other) and $self->isa(blessed($other)); # FIXME reverse left/right if other is more derived?

	$self->inner_equals($other, @_);
}

requires "inner_equals";

__PACKAGE__

__END__
