package B::Simple::Collection::List::Floating;
use Moose;

use B::Simple::OP (); # for the type

use MooseX::AttributeHelpers;

use Moose::Util::TypeConstraints;

use namespace::clean;

coerce "B::Simple::Collection::List" => (
	from "ArrayRef[B::Simple::OP]" => via {
		__PACKAGE__->new(_children => $_);
	},
);

has _children => (
	metaclass => "Collection::Array",
	isa => "ArrayRef[B::Simple::OP]",
	is  => "rw",
	default => sub { [] },
	provides => {
		splice => "splice",
		push => "push",
		pop  => "pop",
		shift => "shift",
		unshift => "unshift",
		# ...
	},
);

with qw(B::Simple::Collection::List); # has to be after the attr

sub children { @{ shift->_children } }


__PACKAGE__

__END__
