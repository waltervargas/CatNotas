package CatNotasWeb::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

CatNotasWeb::Controller::Root - Root Controller for CatNotasWeb

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    if ($c->user_exists){
        $c->res->redirect($c->uri_for('/notas'));
    } else {
        $c->res->redirect($c->uri_for('/login'));
    }
}

sub login : Local {
    my ( $self, $c ) = @_;

    if ($c->req->method eq 'POST'){
        my $cedula      = $c->req->param('cedula');
        my $password    = $c->req->param('password');
        if ($c->authenticate({ cedula => $cedula , password => $password })){
            $c->res->redirect($c->uri_for('/'));
        } else {
            $c->res->redirect($c->uri_for('/login'));
        }
    }

    unless ($c->user_exists){
        $c->stash->{template} = 'login.tt';
    } else {
        $c->res->redirect( $c->uri_for('/'));
    }
}

sub logout : Local {
    my ( $self, $c ) = @_;
    $c->logout;
    $c->res->redirect($c->uri_for('/'));
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Walter Vargas

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
