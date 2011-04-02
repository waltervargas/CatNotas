package CatNotasWeb::Controller::Notas;
use Moose;
use namespace::autoclean;
use Data::Dumper;

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
       # busco las notas: 
       my $rs = $c->model('DB::Persona')->search(cedula => $c->user->cedula);
       my @notas = $rs->first->notas->all;
       my @arrastre = $rs->first->arrastre->all;

       my %materias;
       foreach (@notas){
        $materias{$_->materia->nombre} += $_->nota; 
       }

       my @materias = keys %materias;

       $c->log->debug(Dumper(%materias));

       $c->stash->{notas} = \@notas ;
       $c->stash->{nombre} = $rs->first->nombres;
       $c->stash->{materias} = \@materias;
       $c->stash->{arrastre} = \@arrastre;
       
    } else {
        $c->res->redirect($c->uri_for('/'));
    }
}

sub prueba : Local {
    my ( $self, $c ) = @_;
    $c->stash->{nombre} = 'Lilibeth';
}

sub reporte : Path('/reporte/pdf') {
    my ( $self, $c ) = @_;
    my $file = $c->user->cedula . '.pdf';
    $c->stash->{template} = 'pdf.tt';
    my $rs = $c->model('DB::Persona')->search(cedula => $c->user->cedula);
    my @notas = $rs->first->notas->all;
    my @arrastre = $rs->first->arrastre->all;

    my %materias;
    foreach (@notas){
     $materias{$_->materia->nombre} += $_->nota; 
    }

    my @materias = keys %materias;

    $c->log->debug(Dumper(%materias));

    $c->stash->{notas} = \@notas ;
    $c->stash->{nombre} = $rs->first->nombres;
    $c->stash->{materias} = \@materias;
    $c->stash->{arrastre} = \@arrastre;

    if ($c->forward( 'CatNotasWeb::View::PDF' ) ) {
        $c->response->content_type('application/pdf');
        $c->response->header('Content-Disposition', "attachment; filename=$file");
    }

}


=head1 AUTHOR

Lilibeth Ramírez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
