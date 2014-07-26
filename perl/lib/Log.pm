package Log;
use strict;
use warnings;
use Time::Piece;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
  my $self = shift;
  my @splited = split(/ /, $self->{req});
  return $splited[2];
}

sub method {
  my $self = shift;
  my @splited = split(/ /, $self->{req});
  return $splited[0];
}

sub path {
  my $self = shift;
  my @splited = split(/ /, $self->{req});
  return $splited[1];
}

sub uri {
  my $self = shift;
  my $path = $self->path();
  return "http://" . $self->{host} . $self->path();
}

sub time {
  my $self = shift;
  my $converted_time = gmtime $self->{epoch};
  return $converted_time->datetime;
}

sub to_hash {
  my $self = shift;
  my $h;
  while( my($key, $value) = each %$self) {
    unless($key =~ /(req|epoch|host)/) {
      $h->{$key} = $value;
    }
  }
  $h->{time} = $self->time;
  $h->{uri} = $self->uri;
  $h->{method} = $self->method;

  return $h;
}

1;
