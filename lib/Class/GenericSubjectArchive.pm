# ABSTRACT : hold searchable, arbitrary data on arbitrary subjects
use strict;

package Class::GenericSubjectArchive;

our $VERSION = 'v1.0.2';
##~ DIGEST : 83e45a0f4a87db837386fffcfe3ac9e9

use Moo;
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

ACCESSORS: {

	has something => (
		is      => 'rw',
		lazy    => 1,
		default => sub { return 0 }
	);
}

=head1 SUBROUTINES/METHODS
=head2 PRIMARY SUBS
	Main purpose of the module
=head3 get_subject
	return top level data about $subject
=cut

sub get_subject {
	my ( $self, $subject_id ) = @_;
	return {};
}

sub create_subject {
	my ( $self, $subject_data ) = @_;
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
