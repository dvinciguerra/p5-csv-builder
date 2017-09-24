package CSV::Builder;
# ABSTRACT: CSV::Builder - Simple and chained interface to write csv files

use Object::Simple -base;

# version
our $VERSION = '0.0.1';

# attributes
has 'current_row'    => sub { [] };
has 'current_values' => sub { [] };

# methods
sub new {
    my ( $class, %args ) = @_;
    my $self = $class->SUPER::new(%args);
    return $self;
}

sub add_header {
    my ( $self, %args ) = @_;
    $self->_reset_row(%args);
    return $self;
}

sub add_row {
    my ($self) = shift;
    push @{ $self->{current_values} }, $self->{current_row};
    $self->_reset_row;
    return $self;
}

sub column {
    my ( $self, $name, %args ) = @_;
    return $self->_column( $name, %args );
}

# finish chain
sub to_s {
    my ( $self, %args ) = @_;
    return
      join( "\n", map { join( '; ', @{$_} ) } @{ $self->{current_values} } );
}

sub get_current_row {
    return $_[0]->{current_row};
}

sub get_values {
    return $_[0]->{current_values};
}

sub _column {
    my ( $self, $name, %args ) = @_;
    push @{ $self->{current_row} }, $self->_normalize_value($name);
    return $self;
}

sub _normalize_value {
    my ( $self, $value ) = @_;
    $value =~ s/(\n|\r)/ /g;
    return $value;
}

sub _reset_row {
    my ($self) = shift;
    $self->{current_row} = [];
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

CSV::Builder - Simple and chained interface to write csv files

=head1 STATUS

This is a very early, simple and proof-of-concept version. DO NOT USE THIS MODULE IN PRODUCTION.

=head1 DESCRIPTION

Simple, fun, consistent and modern interface to write CSV files.

=head1 SYNOPSIS

	# create a new structure
	my $csv = CSV::Builder->new;

	# add doc header
	$csv->add_header
		->column('id')
		->column('name');

	# add rows
	$csv->add_row
		->column('1')
		->column('Joe Doe');

	$csv->add_row
		->column('1')
		->column('Joe Doe');

	# show csv file as string
	say $csv->to_s;
	


=head1 AUTHOR

Daniel Vinciguerra E<lt>daniel.vinciguerra@bivee.com.brE<gt>

=head1 COPYRIGHT

Copyright 2017- Daniel Vinciguerra

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
