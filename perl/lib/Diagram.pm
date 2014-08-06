package Diagram;
use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub print_access_count_by_uri {
  my $self = shift;
  my $uris;
  my $biggest = 0;
  my $longest_path = "";
  while( my($key, $value) = each @{ $self->{logs} }) {
    if(not defined($value->{path})) {
      print Dumper $value;
    }
    $uris->{$value->{path}} += 1;
    
    if($uris->{$value->{path}} > $biggest) {
      $biggest = $uris->{$value->{path}};
    }

    if(length($longest_path) < length($value->{path})) {
      $longest_path = $value->{path};
    }
  }
 
  # axis
  print "-" x length($longest_path) . ":";
  for(my $i=0; $i < $biggest/10; $i++) {
    print " " x 9 . ($i+1)*10;
  }
  print "\n";
  
  # body
  foreach my $key (sort {length($a) cmp length($b)} keys %{$uris}) {
    my $space = " " x (length($longest_path) - length($key));
    print $key . $space . ":" . "=" x $uris->{$key} . "\n";
  }
}

1;
