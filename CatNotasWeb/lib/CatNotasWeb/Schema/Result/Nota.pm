package CatNotasWeb::Schema::Result::Nota;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

CatNotasWeb::Schema::Result::Nota

=cut

__PACKAGE__->table("Notas");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nota

  data_type: 'float'
  is_nullable: 0

=head2 num_nota

  data_type: 'integer'
  is_nullable: 0

=head2 id_persona

  data_type: 'integer'
  is_nullable: 0

=head2 id_materia

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nota",
  { data_type => "float", is_nullable => 0 },
  "num_nota",
  { data_type => "integer", is_nullable => 0 },
  "id_persona",
  { data_type => "integer", is_nullable => 0 },
  "id_materia",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to('materia',"CatNotasWeb::Schema::Result::Materia",
    "id_materia");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2011-04-02 00:46:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fSbMhxLsZpDMe2rHIHhb3A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
