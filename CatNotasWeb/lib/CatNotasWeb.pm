package CatNotasWeb;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

# Los plugins para autenticacion son: 
#   Authentication
#    Session
#    Session::Store::FastMmap
#    Session::State::Cookie

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    
    Authentication
    Session
    Session::Store::FastMmap
    Session::State::Cookie
/;

extends 'Catalyst';

__PACKAGE__->config({
 'Plugin::Authentication' => {
 default => {
    credential => {
        class => 'Password', 
        password_field => 'password', 
        password_type => 'clear', 
    }, 
    store => {
        class => 'DBIx::Class', 
        user_model => 'DB::Persona', 
        id_field => 'cedula', 
    }
 }
}, 
});

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in catnotasweb.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.


# Start the application
__PACKAGE__->setup();


=head1 NAME

CatNotasWeb - Catalyst based application

=head1 SYNOPSIS

    script/catnotasweb_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<CatNotasWeb::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Walter Vargas

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
