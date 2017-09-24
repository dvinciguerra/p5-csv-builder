# NAME

CSV::Builder - Simple and chained interface to write csv files

# STATUS

This is a very early, simple and proof-of-concept version. DO NOT USE THIS MODULE IN PRODUCTION.

# DESCRIPTION

Simple, fun, consistent and modern interface to write CSV files.

# SYNOPSIS

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
        

# AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>

# COPYRIGHT

Copyright 2017- Daniel Vinciguerra

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
