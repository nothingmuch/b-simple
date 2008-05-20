package B::Simple::Collection::List;
use Moose::Role;

with qw(B::Simple::Collection);

requires "children";

requires "splice";

sub length {
	scalar(shift->children);
}

sub first {
	(shift->children)[0];
}

sub last {
	(shift->children)[-1];
}

sub shift {
	my $self = shift;
	$self->splice( 0, 1 );
}

# ... push, pop, unshift, etc


__PACKAGE__

__END__
