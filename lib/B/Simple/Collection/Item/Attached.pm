package B::Simple::Collection::Item::Attached;
use Moose;

with qw(B::Simple::Collection::Item);

has _parent => (
	isa => "B::OP::UNOP",
	is  => "ro",
	required => 1,
);

sub child {}
has child => (
	# FIXME write a metaclass to delegate set_value and get_value properly to _parent and then make rw
	does => "B::Simple::Node",
	is   => "ro",
	required => 1, # FIXME look into lazy_build vs. required, not sure how this would work
	lazy_build => 1,
);

sub BUILD {
	shift->child; # force building for required
}

sub _build_child {
	my $self = shift;

	if ( my $parent = $self->_parent ) {
		return $self->node_from_op($parent->first);
	} else {
		Carp::croak "No parent or child provided";
	}
}


__PACKAGE__

__END__
