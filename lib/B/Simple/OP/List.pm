package B::Simple::OP::List;
use Moose::Role;

use B::Simple::Collection::List (); # for the type
use B::Simple::Collection::List::Floating (); # for the coercion

# a node fory listops

with qw(
	B::Simple::Node::Container
	B::Simple::OP
);

has child_collection => (
	does => "B::Simple::Collection::List",
	is   => "rw",
	init_arg => "children",
	coerce   => 1,
	default  => sub {
		require B::Simple::Collection::List::Floating;
		return B::Simple::Collection::List::Floating->new;
	},
	#handles => 'B::Simple::Collection::List', # FIXME broken
);

sub children {
	my ( $self, @args ) = @_;
	$self->child_collection->children(@args);
}

sub splice {
	my ( $self, @args ) = @_;
	$self->child_collection->children(@args);
}

__PACKAGE__

__END__
