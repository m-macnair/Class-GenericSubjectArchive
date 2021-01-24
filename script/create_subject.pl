#!/usr/bin/perl
# ABSTRACT:
our $VERSION = 'v0.0.3';

##~ DIGEST : b25da1013062db2592650dd51142169c

use strict;
use warnings;

package Obj;
use Moo;
use parent 'Moo::GenericRoleClass::CLI'; #provides  CLI, FileSystem, Common
with qw/
  Moo::GenericRole::FileSystem
  Class::GenericSubjectArchive::Role::Storage::JSON

  /;

sub process {
	my ( $self ) = @_;

	my ( $id ) = $self->json_storage_create_subject(
		{
			funky => 'fresh',
			beats => 'ah!',
		}
	);
}
1;

package main;

main();

sub main {
	my $self = Obj->new();
	$self->get_config(
		[
			qw/
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
