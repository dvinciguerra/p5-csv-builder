requires 'perl', '5.008005';

# requires 'Some::Module', 'VERSION';
requires 'Object::Simple';

on test => sub {
    requires 'Test::More', '0.96';
};
