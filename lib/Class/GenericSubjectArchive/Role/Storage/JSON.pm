# ABSTRACT : store/retrieve json subject documents
use strict;

package Class::GenericSubjectArchive::Role::Storage::JSON;

our $VERSION = 'v1.0.3';
##~ DIGEST : 694e915b932d2b42bb36f2857e07c753

use Moo::Role;
with qw/
  Moo::GenericRole::JSON
  Moo::GenericRole::UUID
  Moo::GenericRole::FileIO
  /;
use 5.006;
use warnings;

=head1 NAME
	~
=head1 VERSION & HISTORY
	<breaking revision>.<feature>.<patch>
	1.0.0 - <date>
		<actions>
	1.0.0 - <date unless same as above>
		The Mk1
=cut

=head1 SYNOPSIS
	TODO
=head2 TODO
	Generall planned work
=head1 ACCESSORS
=cut

use Carp;
ACCESSORS: {

	# TODO die on not set
	has json_storage_path => ( is => 'rw', lazy => 1, default => sub { Carp::confess( "json_storage_path not set" ) } );
}

=head1 SUBROUTINES/METHODS
=head2 LIFECYCLE SUBS
=cut

sub BUILD {
	my ( $self, $args ) = @_;
	$self->json->canonical( 1 );
	$self->json->pretty( 1 );
}

=head2 PRIMARY SUBS
	Main purpose of the module
=head3
=cut

sub json_storage_retrieve_subject {
	my ( $self,         $subject_id ) = @_;
	my ( $subject_path, $exists )     = $self->_json_storage_subject_path( $subject_id );
	if ( $exists ) {
		return $self->json_load_file( $subject_path );
	} else {
		return undef;
	}
}

sub json_storage_create_subject {
	my ( $self, $data, $subject_id ) = @_;
	$subject_id ||= $self->get_uuid();
	my ( $subject_path, $exists ) = $self->_json_storage_subject_path( $subject_id );
	if ( $exists ) {
		return ( -1 );
	} else {
		$self->json_write_href( $subject_path, $data );
		return $subject_id;
	}
}

sub _json_storage_subject_path {
	my ( $self, $subject_id ) = @_;
	my $subject_path = $self->file_substring_path( $self->json_storage_path . "/$subject_id" );
	return ( $subject_path, -f $subject_path );
}

=head2 WRAPPERS
=head3 external_function
=cut

=head1 AUTHOR
	mmacnair, C<< <mmacnair at cpan.org> >>
=head1 BUGS
	TODO Bugs
=head1 SUPPORT
	TODO Support
=head1 ACKNOWLEDGEMENTS
	TODO
=head1 COPYRIGHT
 	Copyright 2021 mmacnair.
=head1 LICENSE
	TODO
=cut

1;
