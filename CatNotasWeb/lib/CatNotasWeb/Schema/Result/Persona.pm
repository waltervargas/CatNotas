package CatNotasWeb::Schema::Result::Persona;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

CatNotasWeb::Schema::Result::Persona

=cut

__PACKAGE__->table("personas");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nombres

  data_type: 'varchar'
  is_nullable: 0

=head2 apellidos

  data_type: 'varchar'
  is_nullable: 1

=head2 cedula

  data_type: 'integer'
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nombres",
  { data_type => "varchar", is_nullable => 0 },
  "apellidos",
  { data_type => "varchar", is_nullable => 1 },
  "cedula",
  { data_type => "integer", is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("sqlite_autoindex_personas_1", ["cedula"]);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2011-04-02 00:46:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pFR3IaOcqBB8s4JCM6zM3A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
