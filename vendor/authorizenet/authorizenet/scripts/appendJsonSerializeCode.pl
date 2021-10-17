#!/usr/bin/perl
use strict;
use warnings;

#my $text = `cat ARBGetSubscriptionRequest.php`;
#my $sub = `cat appendSetCode.txt`;
#$text =~ s|(.+)}|$1$sub|xms;
#print 'Result : '.$text."\n";


while (<>) {
    chomp;
    my $filepath = "lib/net/authorize/api/contract/v1/";
    my $filename = "$filepath"."$_";
    my $text = `cat $filename`;
    my $sub = "";

    if ($text =~ /(?^pm:\nclass \w+ extends )/) {
        $sub = `cat scripts/appendJsonSerializeSubClassCode.txt`;
    } else {
        $sub = `cat scripts/appendJsonSerializeCode.txt`;
    }

    $text =~ s|(.+)}|$1$sub|xms;

    open(my $fh, '>', "$filename");
    print $fh $text;
    close $fh;
#    print 'Result : '.$text."\n";
}
#unless(mkdir 'backup') {
#        die "Unable to create directory backup\n";
#    }
#open(my $fh, '>', 'backup/ARBGetSubscriptionRequest copy2.php');
#print $fh "My first report generated by perl\n";
#close $fh;
