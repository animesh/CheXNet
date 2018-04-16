my $path=shift @ARGV;
my @files = glob( "$path/*.png");
@files = map {split(/\//,$_)} @files;
@files=do { my %seen; grep { !$seen{$_}++ } @files };
#print join("\n",@files);
my $pathlab=shift @ARGV;
@txtlab=<$pathlab/*.txt>;
 foreach my $file (@txtlab) {
    if (-f $file) {
	print $file;
	open(F,$file);
	open(FO,">$file.sel");
	while(<F>){
	 for(my $c=0;$c<=$#files;$c++){
	  if(/^$files[$c]/){ print FO}
	 }
	}
	close(F);
	close(FO)
    }
  }
__END__
perl filterList.pl ChestX-ray14/images ChestX-ray14/labels
