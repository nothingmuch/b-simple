package B::Simple::Factory;
use Moose;

use B::Simple::Util qw(l);
use Carp qw(croak);

use namespace::clean;

# helps to create node objects from B::OP objects or other things

my %name_to_class = (
	lineseq => "B::Simple::OP::Block",
	scope => "B::Simple::OP::Block",
	const => "B::Simple::OP::Const",
);

sub new_from_op {
	my ( $self, $op, @args ) = @_;

	my $class = $name_to_class{$op->name}
		or croak "No class found for " . $op->name;

	l($class)->new_from_op($op, @args, factory => $self);
}

__PACKAGE__

__END__
