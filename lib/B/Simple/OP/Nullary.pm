package B::Simple::OP::Nullary;
use Moose::Role;

# SVOP, COP, etc

with qw(
	B::Simple::Node
	B::Simple::OP
);

sub inner_equals { }

__PACKAGE__

__END__
