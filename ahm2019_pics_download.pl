#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;
use Cwd qw(getcwd);
 
my $bib_number = $ARGV[0];
my $bib_url ="https://photos.oneglint.com/select?eventName=Airtel%20Hyderabad%20Marathon%202019&bibNumber=$bib_number";

my $mech = WWW::Mechanize->new();
$mech->get( $bib_url );
my $content = $mech->content;
my ($images_raw) = $content =~ m/var allimage = (.*)}];/mgi;
my @image_urls = $images_raw =~ m|"s3":"(.*?)"}|mgi;

@image_urls = map {s|\\||g; $_; } @image_urls;
@image_urls = map {s|thumbs|fullimg|g; $_; } @image_urls;
@image_urls = map {s|_T||g; $_; } @image_urls;

print "@image_urls\n";

unless(mkdir($bib_number, 0755)) {
    die "Unable to create $bib_number\n";
}

chdir "$bib_number";

system("wget $_") foreach @image_urls;
