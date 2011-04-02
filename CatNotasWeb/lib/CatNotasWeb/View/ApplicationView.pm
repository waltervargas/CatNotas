package CatNotasWeb::View::ApplicationView;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    INCLUDE_PATH => [ 
        CatNotasWeb->path_to('root', 'lib'),  
        CatNotasWeb->path_to('root', 'src') 
    ], 
    render_die => 1,
    WRAPPER => 'header.tt', 
    CATALYST_VAR => 'c', 
);

=head1 NAME

CatNotasWeb::View::ApplicationView - TT View for CatNotasWeb

=head1 DESCRIPTION

TT View for CatNotasWeb.

=head1 SEE ALSO

L<CatNotasWeb>

=head1 AUTHOR

Lilibeth Ramírez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
