package CatNotasWeb::Schema::Result::Materia_Arrastre;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

CatNotasWeb::Schema::Result::Materia

=cut

__PACKAGE__->table("materias_arrastre");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nombre

  data_type: 'varchar'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_materia",
  { data_type => "integer", is_nullable => 1 },
  "id_persona",
  { data_type => "integer", is_nullable => 1 },
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id_materia");
__PACKAGE__->belongs_to('materia',"CatNotasWeb::Schema::Result::Materia","id_materia");
__PACKAGE__->belongs_to('persona',"CatNotasWeb::Schema::Result::Persona","id_persona");



# Created by DBIx::Class::Schema::Loader v0.07000 @ 2011-04-02 00:46:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NVcIRrqB3uObO7Zzc+rVhw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
