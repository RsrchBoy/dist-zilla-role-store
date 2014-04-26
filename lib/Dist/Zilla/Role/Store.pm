#
# This file is part of Dist-Zilla-Role-Store
#
# This software is Copyright (c) 2014 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Dist::Zilla::Role::Store;
BEGIN {
  $Dist::Zilla::Role::Store::AUTHORITY = 'cpan:RSRCHBOY';
}
# git description: b732657
$Dist::Zilla::Role::Store::VERSION = '0.000001'; # TRIAL

# ABSTRACT: A dynamic stash^Wstore of common data

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

with 'Dist::Zilla::Role::Stash';

has zilla => (
    is              => 'ro',
    weaken          => 1,
    init_arg        => '_zilla',
    isa_instance_of => 'Dist::Zilla::Builder',
);

before register_component => sub {
    my ($class, $name, $arg, $section) = @_;

    # stash our 'zilla!
    $arg->{_zilla} ||= $section->sequence->assembler->zilla;
    return;
};


!!42;

__END__

=pod

=encoding UTF-8

=for :stopwords Chris Weyl

=head1 NAME

Dist::Zilla::Role::Store - A dynamic stash^Wstore of common data

=head1 VERSION

This document describes version 0.000001 of Dist::Zilla::Role::Store - released April 25, 2014 as part of Dist-Zilla-Role-Store.

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SOURCE

The development version is on github at L<http://https://github.com/RsrchBoy/dist-zilla-role-store>
and may be cloned from L<git://https://github.com/RsrchBoy/dist-zilla-role-store.git>

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/RsrchBoy/dist-zilla-role-store/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut
