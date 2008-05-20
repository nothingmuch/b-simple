#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';

use B::Simple::Util;

use Scalar::Util qw(blessed);

use ok 'B::Simple::Factory';

use ok 'B::Simple::OP::Block';
use ok 'B::Simple::OP::Const';

sub code_optree_is ($$;$) {
	my ( $got, $exp, $desc ) = @_;
	$desc ||= "optree for '$got'" unless ref $got;

	local $Test::Builder::Level = $Test::Builder::Level + 1;

	trees_equal(
		$got,
		$exp,
		$desc,
	);
}

sub trees_equal {
	my ( $got, $exp, $desc ) = @_;

	local $Test::Builder::Level = $Test::Builder::Level + 1;

	ok( blessed($got) && $got->equals($exp), $desc );
}

my $factory = B::Simple::Factory->new;

sub sub_body_tree ($) {
	my $sub = shift;
	$sub = eval $sub unless ref $sub;

	push our(@subs), $sub; # don't gc the optree

	my $cv_obj = B::svref_2object($sub);

	my $op = $cv_obj->ROOT->first;

	$factory->new_from_op($op);
}

#tree_equals(
#	sub_body_tree('sub { }'),
#	B::Simple::OP::Block->new( ),
#);

code_optree_is(
	sub_body_tree('sub { 1 }'),
	B::Simple::OP::Block->new(
		children => [
			B::Simple::OP::Const->new(
				sv => \1, # FIXME value or sv?
				# type => IV ?
				#context => "inherit",
			),
		],
	),
);

__END__

tree_equals(
	sub_body_tree('my $x; sub { $x }'),
	B::Simple::OP::Block->new(
		children => [
			B::Simple::OP::Variable::Lexical->new(
				name => '$x',
				introduce => 0,
				context => "inherit",
			),
		],
	),
);

tree_equals(
	sub_body_tree('sub { my $x }'),
	B::Simple::OP::Block->new(
		children => [
			B::Simple::OP::Variable::Lexical->new(
				name => '$x',
				introduce => 1,
				context => "inherit",
			),
		],
	),
);

