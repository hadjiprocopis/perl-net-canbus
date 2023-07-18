use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
    NAME             => 'Net::CANbus',
    AUTHOR           => q{Andreas Hadjiprocopis <bliako@cpan.org>},
    VERSION_FROM     => 'lib/Net/CANbus.pm',
    ABSTRACT_FROM    => 'lib/Net/CANbus.pm',
    LICENSE          => 'artistic_2',
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    TEST_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
    },
    OBJECT => '$(O_FILES)',
    LIBS    => '',
    CCFLAGS => <<EOCCFLAGS,
	-O2 -Wall -Wno-parentheses \\
        -DAF_CAN=PF_CAN \\
        -DPF_CAN=29 \\
        -DSO_RXQ_OVFL=40 \\
        -DSCM_TIMESTAMPING_OPT_STATS=54 \\
        -DCLOCK_TAI=11 \\
        -DSO_TXTIME=61 \\
        -DSCM_TXTIME=SO_TXTIME \\
        -D_FILE_OFFSET_BITS=64 \\
        -D_GNU_SOURCE
EOCCFLAGS
    CC      => 'gcc',
    LD      => 'gcc',
    XSOPT   => '',

    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Net-CANbus-*' },
);

# Compatibility with old versions of ExtUtils::MakeMaker
unless (eval { ExtUtils::MakeMaker->VERSION('6.64'); 1 }) {
    my $test_requires = delete $WriteMakefileArgs{TEST_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$test_requires} = values %$test_requires;
}

unless (eval { ExtUtils::MakeMaker->VERSION('6.55_03'); 1 }) {
    my $build_requires = delete $WriteMakefileArgs{BUILD_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$build_requires} = values %$build_requires;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
    unless eval { ExtUtils::MakeMaker->VERSION('6.52'); 1 };
delete $WriteMakefileArgs{MIN_PERL_VERSION}
    unless eval { ExtUtils::MakeMaker->VERSION('6.48'); 1 };
delete $WriteMakefileArgs{LICENSE}
    unless eval { ExtUtils::MakeMaker->VERSION('6.31'); 1 };

WriteMakefile(%WriteMakefileArgs);
