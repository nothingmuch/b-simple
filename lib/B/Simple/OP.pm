package B::Simple::OP;
use Moose::Role;

with qw(
	B::Simple::Node
	B::Simple::Role::Equality
);

has parent => (
	is => "rw",
	predicate => "has_parent",
	is_weak => 1, # FIXME Not for attached optrees
);

__PACKAGE__

__END__
