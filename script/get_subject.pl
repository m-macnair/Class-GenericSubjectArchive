#!/usr/bin/perl
# ABSTRACT:
our $VERSION = 'v0.0.3';

##~ DIGEST : 1b4a0fb773cc0eaed53eb661ae778418

use strict;
use warnings;

package Obj;
use Moo;
use parent 'Moo::GenericRoleClass::CLI'; #provides  CLI, FileSystem, Common
with qw/
  Moo::GenericRole::FileSystem

  /;

sub process {
	my ( $self ) = @_;

	print $self->file_substring_path( $self->cfg->{in_file} );
}
1;

package main;

main();

sub main {
	my $self = Obj->new();
	$self->get_config(
		[
			qw/
			  in_file
			  json_storage_path
			  /
		],
		[qw//],
		{
			required => {},
			optional => {}
		}
	);
	$self->cfg_to_accessors();
	$self->process();

}
