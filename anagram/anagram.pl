#!/usr/bin/perl

my $debug = 1;

print "\nTratando entrada:\n" if $debug;
foreach(@ARGV){

  # Para cada argumento, popule o array @arg com uma letra por indice do array
  my @arg = split(//,$_);

  # Coloque no $oword a palavra original (convertendo array pra escalar)
  my $oword = join('',@arg);

  # Coloque no $sword a palavra ordenada (ordenando array e convertendo para escalar)
  my $sword = join('',sort(@arg));

  print "- Populando indice $sword com palavra $oword \n" if $debug;

  # Popule um hash cujo indice eh a palavra ordenada com o valor da palavra original
  push(@{$hash{$sword}{palavras}}, $oword);


}

print "\nAnagramas encontrados:\n";

# Varre os indices do hash populado (que eh a palavra ordenada)
foreach(keys(%hash)){

  # coloca o indice em $key
  my $key = $_;

  # se a contagem de palavras no subindice palavras for maior que 1,
  # eh pq mais de uma palavra possui a mesma forma quando ordenada,
  # logo, anagramas
  if(scalar(@{$hash{$key}{palavras}}) > 1){
    print "[$key] Palavras: @{$hash{$key}{palavras}} \n";
  }
}
print "\n";

