package Net::CANbus;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.01';

use vars qw($VERSION @ISA);

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
	CANsend
	CANsend_xs
);

BEGIN {
    # SAME $VERSION as above else mismatch!
    $VERSION = '0.01';
    if ($] > 5.006) {
        require XSLoader;
        XSLoader::load(__PACKAGE__, $VERSION);
    } else {
        require DynaLoader;
        @ISA = qw(DynaLoader);
        __PACKAGE__->bootstrap;
    }
}

sub CANsend {
	my ($deviceid, $canframe) = @_;
	return CANsend_xs($deviceid, $canframe);
}

=head1 NAME

Net::CANbus - Perl wrapper for sending data to the CANbus using can-utils

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    use Net::CANbus qw/CANsend CANsend_xs/;

    my $rc = CANsend($deviceid, $canframe);
    die "failed with return code $rc" unless $rc == 0;
    ...

=head1 EXPORT

=head1 SUBROUTINES/METHODS

=head2 CANsend($deviceid, $canframe)

It sends `$canframe` data to the CANbus
interface identified by `$deviceid`.
Internally it calls L<CANsend_xs>
which you can use directly.

It returns 0 on success or 1 on error.

=head2 CANsend_xs($deviceid, $canframe)

It sends `$canframe` data to the CANbus
interface identified by `$deviceid`.
Internally it calls cansend() which is
implemented by can-utils (see L<https://github.com/linux-can/can-utils>)

It returns 0 on success or 1 on error.

=head1 AUTHOR

Perl and XS code by Andreas Hadjiprocopis, C<< <bliako at cpan.org> >>

can-utils code by L<https://github.com/linux-can/can-utils>


=head1 BUGS

Please report any bugs or feature requests to C<bug-net-canbus at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-CANbus>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::CANbus


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-CANbus>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/Net-CANbus>

=item * Search CPAN

L<https://metacpan.org/release/Net-CANbus>

=back


=head1 ACKNOWLEDGEMENTS


https://github.com/linux-can/can-utils


=head1 INFORMATION

L<https://en.wikipedia.org/wiki/SocketCAN>


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2023 by Andreas Hadjiprocopis.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1; # End of Net::CANbus
