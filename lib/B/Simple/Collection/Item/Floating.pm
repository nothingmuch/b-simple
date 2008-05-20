package B::Simple::Collection::Item::Floating;
use Moose;

with qw(B::Simple::Collection::Item);

sub child {}
has child => (
	does => "B::Simple::Node",
	is   => "rw",
	required => 1,
);


__PACKAGE__

__END__
