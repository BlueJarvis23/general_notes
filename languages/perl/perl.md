
# Perl

Make sure to make use of `perldoc` which is the internal/buitin documentation for Perl. To start just type: `perldoc perl`.

Perldoc can also be used to look at perl modules for example `perldoc Class::Tiny`.

## Manually Installing Modules

Usually used when you don't have root access to the system of interest.

To do this:
- Download module \*.tar.gz
- cd into the extracted directory

```
perl Makefile.PL PREFIX=~/lib/perl5
make
make test
make install
```

The `PREFIX=~/lib/perl5` to the desired lib location is the key to local installs instead of system wide version.

*Note*: That many time the make test will fail and it can be ignored.

