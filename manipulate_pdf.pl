#!/usr/bin/perl
use warnings;
use strict;
use CAM::PDF;

my $pdf = CAM::PDF->new('Ritesh_Kamal_CV.pdf'); 
my $page1 = $pdf->getPageContent(1);

$page1 =~ s/5.5/6.8/g;

$pdf->setPageContent(1,$page1);
$pdf->save();
$pdf->cleanoutput('out1.pdf');


