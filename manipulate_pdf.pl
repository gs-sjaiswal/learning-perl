#!/usr/bin/perl
use warnings;
use strict;
use CAM::PDF;

# replace file-name.pdf with real file name
my $file_to_edit = "file-name.pdf";

# Create an object of CAM::PDF
my $pdf = CAM::PDF->new("$file_to_edit");

# get the page content of page number 1
my $page1 = $pdf->getPageContent(1);

# Replace the string globally on page 1
$page1 =~ s/replace/with-this/gim;

# Set it and save it in new file
$pdf->setPageContent(1, $page1);
$pdf->cleanoutput("Mahi-$file_to_edit");
