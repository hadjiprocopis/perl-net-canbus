# NAME

Net::CANbus - The great new Net::CANbus!

# VERSION

Version 0.01

# SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::CANbus;

    my $rc = Net::CANbus::CANsend($deviceid, $canframe);
    die "failed with return code $rc" unless $rc == 0;
    ...

# EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

# SUBROUTINES/METHODS

## cansend

# AUTHOR

Andreas Hadjiprocopis, `<bliako at cpan.org>`

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
