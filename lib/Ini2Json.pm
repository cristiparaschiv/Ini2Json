package Ini2Json;

use 5.020002;
use strict;
use warnings;
use Config::IniFiles;
use JSON;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $ini_path = shift;
    my $self = {
        ini => undef,
        json => undef
    };

    my %ini;

    if (not defined $ini_path) {
        die "You must provide input file\n";
    }

    tie %ini, 'Config::IniFiles', ( -file => $ini_path );

    $self->{ini} = \%ini;

    bless $self, $class;

    return $self;
}

sub encode {
    my $self = shift;

    my $data = $self->{ini};
    my $json = encode_json $data;
    $self->{json} = $json;
}

sub write {
    my $self = shift;
    my $target = shift;

    if (not defined $target) {
        die "You must provide target directory\n";
    }

    my $filename = $target . "/output.json";
    open (my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $self->{json};
    close $fh;
}

1;
__END__

=head1 NAME

Ini2Json - Perl extension for converting INI files to JSON format

=head1 SYNOPSIS

  use Ini2Json;
  
  my $converter = Ini2Json->new('/path/to/ini/file');
  $converter->encode();
  $converter->write('/target/directory');

=head1 DESCRIPTION

This module converts INI files to JSON format. Tha path to the INI file is passed in the constructor and the target directory where the JSON file will be written is passed to the write method.

=head2 EXPORT

None by default.

=head1 AUTHOR

Cristi Paraschiv, E<lt>cristianv.paraschiv@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Cristi Paraschiv

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
