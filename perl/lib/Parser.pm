package Parser;
use strict;
use warnings;
use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
  my $self = shift;
  open my $fh, '<', $self->{filename} or die $!;
  my @lines = <$fh>;
  my @result = map {
    Log->new(
      map {
        chomp($_);
        my @splited=split(/:/, $_, 2);
        $splited[0] => $splited[1]
      } grep {
        /.:[^\-]./
      } split(/\t/, $_)
    );
  } @lines;
  return \@result; # not return @result
}

1;
