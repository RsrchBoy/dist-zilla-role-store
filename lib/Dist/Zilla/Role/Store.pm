package Dist::Zilla::Role::Store;

# ABSTRACT: A dynamic stash^Wstore of common data

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

with 'Dist::Zilla::Role::Stash';

has zilla => (
    is              => 'ro',
    weak_ref        => 1,
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

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=cut
