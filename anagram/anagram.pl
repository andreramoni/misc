#!/usr/bin/perl
my $debug = 1;
print "\nTratando entrada:\n" if $debug;
foreach(@ARGV){
  my @arg = split(//,$_);
  my $oword = join('',@arg);
  my $sword = join('',sort(@arg));
  print "- Populando indice $sword com palavra $oword \n" if $debug;
  push(@{$hash{$sword}{palavras}}, $oword);
}
print "\nAnagramas encontrados:\n";
foreach(keys(%hash)){
  my $key = $_;
  if(scalar(@{$hash{$key}{palavras}}) > 1){
    print "[$key] Palavras: @{$hash{$key}{palavras}} \n";
  }
}
print "\n";

