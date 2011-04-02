package CatNotasWeb::Controller::Notas;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

CatNotasWeb::Controller::Notas - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 indexx

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    if ($c->user_exists) {
        
    } else {
        $c->res->redirect($c->uri_for('/'));
    }
}

sub prueba : Local {
    my ( $self, $c ) = @_;
    $c->stash->{nombre} = 'Lilibeth';
}


=head1 AUTHOR

Lilibeth Ramírez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
