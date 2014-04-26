package Dist::Zilla::Role::Store;

# ABSTRACT: A dynamic stash^Wstore of common data

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

with 'Dist::Zilla::Role::Stash' => {
    -excludes => [ 'register_component' ],
    -alias    => { register_component => '_stash_register_component' },
};

has zilla => (
    is              => 'ro',
    weak_ref        => 1,
    init_arg        => '_zilla',
    required        => 1,
    isa_instance_of => 'Dist::Zilla',
);

sub register_component {
    my ($class, $name, $arg, $section) = @_;

    # stash our 'zilla!
    $arg->{_zilla} = $section->sequence->assembler->zilla;
    return shift->_stash_register_component(@_);
}

!!42;
__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=cut
