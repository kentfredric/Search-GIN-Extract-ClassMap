package Search::GIN::Extract::ClassMap::Does;

# $Id:$
use strict;
use warnings;
use Moose;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;
extends 'Search::GIN::Extract::ClassMap::Base';



sub matches {
  my ( $self, $object ) = @_;
  return if not blessed $object;
  for my $class ( $self->classmap_entries ){
    if ( $object->does( $class ) ){
      return $self->classmap_get( $class );
    }
  }
  return;
}

1;

