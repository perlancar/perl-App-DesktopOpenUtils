package App::DesktopOpenUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

our %SPEC;

$SPEC{open_desktop} = {
    v => 1.1,
    args => {
        paths_or_urls => {
            'x.name.is_plural' => 1,
            'x.name.singular' => 'path_or_url',
            schema => ['array*', of=>'str*'],
            req => 1,
            pos => 0,
            slurpy => 1,
        },
        #all => {
        #    schema => 'true*',
        #},
    },
    features => {
        dry_run => 1,
    },
};
sub open_desktop {
    require Desktop::Open;

    my %args = @_;
    for my $path_or_url (@{ $args{paths_or_urls} }) {
        if ($args{-dry_run}) {
            #my $cmd = $args{all} ?
            #    Browser::Open::open_browser_cmd_all() :
            #    Browser::Open::open_browser_cmd();
            #log_info "[DRY_RUN] Opening %s in browser with: %s ...", $url, $cmd;
            #log_info "[DRY_RUN] Opening %s ...", $path_or_url;
        } else {
            log_trace "Opening %s ...", $path_or_url;
            #Desktop::Open::open_desktop($url, $args{all});
            Desktop::Open::open_desktop($path_or_url);
        }
    }
    [200];
}

1;
# ABSTRACT: Utilities related to Desktop::Open

=head1 SYNOPSIS


=head1 DESCRIPTION

This distribution includes several utilities:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<Desktop::Open>

L<App::BrowserOpenUtils>
