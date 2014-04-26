package Dist::Zilla::Role::Store;

# ABSTRACT: A dynamic stash^Wstore of common data

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

with 'Dist::Zilla::Role::Stash' => {
    -excludes => [ 'register_component' ],
    -alias    => { register_component => '_stash_register_component' },
};

=attr zilla

A read-only attribute storing a reference to our L<Dist::Zilla> overlord.

I, for one, welcome our L<Dist::Zilla> overlord.

=cut

has zilla => (
    is              => 'ro',
    weak_ref        => 1,
    init_arg        => '_zilla',
    required        => 1,
    isa_instance_of => 'Dist::Zilla',
);

=method register_component

We wrap L<Dist::Zilla::Role::Stash/register_component> such that our L</zilla>
attribute is populated when an instance of a class composed with us is
created.

=cut

sub register_component {
    my ($class, $name, $arg, $section) = @_;

    # stash our 'zilla!
    $arg->{_zilla} = $section->sequence->assembler->zilla;
    return shift->_stash_register_component(@_);
}

!!42;
__END__

=for :stopwords zilla

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=cut
