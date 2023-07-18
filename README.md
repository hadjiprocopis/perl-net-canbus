# NAME

Net::CANbus - Perl wrapper for sending data to the CANbus using can-utils

# VERSION

Version 0.01

# SYNOPSIS

    use Net::CANbus qw/CANsend CANsend_xs/;

    my $rc = CANsend($deviceid, $canframe);
    die "failed with return code $rc" unless $rc == 0;
    ...

# EXPORT

# SUBROUTINES/METHODS

## CANsend($deviceid, $canframe)

It sends \`$canframe\` data to the CANbus
interface identified by \`$deviceid\`.
Internally it calls [CANsend\_xs](https://metacpan.org/pod/CANsend_xs)
which you can use directly.

It returns 0 on success or 1 on error.

## CANsend\_xs($deviceid, $canframe)

It sends \`$canframe\` data to the CANbus
interface identified by \`$deviceid\`.
Internally it calls cansend() which is
implemented by can-utils (see [https://github.com/linux-can/can-utils](https://github.com/linux-can/can-utils))

It returns 0 on success or 1 on error.

# AUTHOR

Perl and XS code by Andreas Hadjiprocopis, `<bliako at cpan.org>`

can-utils code by [https://github.com/linux-can/can-utils](https://github.com/linux-can/can-utils)

# BUGS

Please report any bugs or feature requests to `bug-net-canbus at rt.cpan.org`, or through
the web interface at [https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-CANbus](https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-CANbus).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::CANbus

You can also look for information at:

- RT: CPAN's request tracker (report bugs here)

    [https://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-CANbus](https://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-CANbus)

- CPAN Ratings

    [https://cpanratings.perl.org/d/Net-CANbus](https://cpanratings.perl.org/d/Net-CANbus)

- Search CPAN

    [https://metacpan.org/release/Net-CANbus](https://metacpan.org/release/Net-CANbus)

# ACKNOWLEDGEMENTS

# LICENSE AND COPYRIGHT

This software is Copyright (c) 2023 by Andreas Hadjiprocopis.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)
