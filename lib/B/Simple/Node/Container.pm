package B::Simple::Node::Container;
use Moose::Role;

with qw(B::Simple::Node);

# a node with child nodes

requires "children";

sub children_equal {
	my ( $self, $other, @args ) = @_;

	my @self_children = $self->children;

	my @other_children = $other->children;

	return unless @self_children == @other_children;

	foreach my $self_child ( @self_children ) {
		my $other_child = shift @other_children;
		return unless $self_child->equals($other_child);
	}

	return 1;
}


__PACKAGE__

__END__
