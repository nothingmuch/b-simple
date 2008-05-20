package B::Simple::Collection::List::Attached;
use Moose::Role;

use B::Simple::OP (); # needed for ArrayRef[B::Simple::OP]

with qw(
	B::Simple::Collection::List
	B::Simple::FactoryDelegate
);

use B::Utils ();

has root => (
	isa => "B::OP",
	is  => "ro",
	required => 1,
);

# has first
# has last
# has children
# has length

has _children => (
	isa => "ArrayRef[B::Simple::OP]",
	is  => "rw",
	lazy_build => 1,
);

sub _build__children {
    my $self = shift;
    [ map { $self->factory->new_from_op($_, parent => $self) } $self->root->kids ];
}

sub children { @{ shift->_children } }

sub splice { die "not yet written" }

__PACKAGE__

__END__
