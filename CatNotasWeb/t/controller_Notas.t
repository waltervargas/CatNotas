use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'CatNotasWeb' }
BEGIN { use_ok 'CatNotasWeb::Controller::Notas' }

ok( request('/notas')->is_success, 'Request should succeed' );
done_testing();
