# Ini2Json

This module helps converting files in INI format to JSON format.

### Installation

To install this module type the following

```sh
perl Makefile.PL
make
make test
make install
```

### Dependencies

This module requires these other modules:

```sh
Config::IniFiles
```

### Synopsis

```perl
use Ini2Json;

my $converter = Ini2Json->new('/path/to/ini/file');
$converter->encode();
$converter->write('/target/directory');
```
