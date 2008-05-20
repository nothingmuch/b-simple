package B::Simple::OP::Unary;
use Moose::Role;

# an op with a single child

with qw(
	B::Simple::Node::Container
	B::Simple::OP
);

has _child => (
	does => "B::Simple::Collection::Item",
);

sub children {
	my $self = shift;
	$self->child;
}


__PACKAGE__

__END__
