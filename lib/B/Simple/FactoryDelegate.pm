package B::Simple::FactoryDelegate;
use Moose::Role;

# for an object that wants to instantiate children with the same factory that made it

has factory => (
	isa => "B::Simple::Factory",
	is  => "rw",
	#handles => qr/.*/, # FIXME think about this
);

__PACKAGE__

__END__
