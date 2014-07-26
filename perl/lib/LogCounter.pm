package LogCounter;
use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
  my $self = shift;
  my $users;
  map {
    if(defined($_->{user})) {
      push(@{ $users->{$_->{user}} }, $_);
    } else {
      push(@{ $users->{guest} }, $_);
    }
  } @{ $self->{logs} };
  return $users;
}

sub count_error {
  my $self = shift;
  my $cnt_error = 0;
  map {
    if($_->{status} =~ /5[0-9][0-9]/) {
      $cnt_error++;
    }
  } @{ $self->{logs} };
  return $cnt_error;
}

1;
