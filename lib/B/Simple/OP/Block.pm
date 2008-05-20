package B::Simple::OP::Block;
use Moose;

use B::Simple::Util;

use B::Simple::OP::Block::AttachedChildren;

use namespace::clean;

# a block of code is either a lineseq (loop or sub body) or a do { }/${ }'s body (scope, enter/leave)
# depending on what it's attached to

with qw(B::Simple::OP::List);

sub new_from_op {
	my ( $class, $op, @args ) = @_;

	$class->new(
		@args,
		children => $class->_new_collection(root => $op, @args),
	);
}

sub _collection_class { "B::Simple::OP::Block::AttachedChildren" }

sub _new_collection {
	my ( $class, @args ) = @_;
	$class->_collection_class->new(@args);
}

sub inner_equals {
	my ( $self, $other, @args ) = @_;

	# Body has no value of it's own, lineseq/scope is a meaningless op
	$self->children_equal( $other, @args );
}

__PACKAGE__

__END__
