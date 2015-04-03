#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple; # get(url)
#use hal;



# mot
my $mot_chercher = "michel";
#chomp ($mot_chercher);


# reponse = json, xml, xml-tei, bibtex, endnote, rss, atom, csv
my $wtb = "bibtex";
my $wt = '&wt=' . $wtb;


my @res = &creer_url($mot_chercher,$wt);
print "@res \n";


#------------------------------------------------------------------------------
sub downloader_de_page {
my ($url) = @_ ;
if (my $page = get($url)) {
return $page;
}
else {
return 0;
};
}


#------------------------------------------------------------------------------
sub creer_url {
my ($mot) = @_ ;
my $url_api = "http://api.archives-ouvertes.fr/search/?q=";
my $url_creee = $url_api . $mot . $wt ;
my $page_res = &downloader_de_page($url_creee);
#if ($page_isbn) {
print $page_res;
return $page_res;
};