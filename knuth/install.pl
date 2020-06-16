#!/usr/bin/perl
use strict;
use Getopt::Std;

use vars qw($opt_x $opt_n);
&getopts("xn");

$ENV{"LANG"} = "C";
my %change = (
    "sat11k" => "sat11.w",
    "sat-queens-color-order-organpipe" => "sat-queens-color-order-cliques2.w",
    "sat-graph-cyc" => "graph-cyc.w",
    "word_giant" => "word_components.w",
    );

if (! $opt_x) {
    print "##### Downloading\n";
    &download();
}
&cmd("mkdir bin pdf");
&cmd("rm bin/* pdf/*");
print "##### Installing SGB\n";
&sgb();
print "##### Installing SAT solvers and some other programs\n";
&sat();
print "##### Installing SAT examples\n";
&examples();
print "##### Installing SAT life\n";
&life();
print "##### All done\n";
exit 0;

sub download {
    my $dir = "downloads";
    my $curl = "curl -OsS";
    my $sgb = "ftp://ftp.cs.stanford.edu/pub/sgb";
    my $url = "https://www-cs-faculty.stanford.edu/~knuth/programs";
    &cmd("mkdir $dir");
    &cmd("rm -rf $dir/*");
    &ch_dir($dir);
    &cmd("$curl $sgb/sgb.tar.gz");
    &cmd("$curl $url/dimacs-to-sat.w");
    &cmd("$curl $url/sat-to-dimacs.w");
    &cmd("$curl $url/sat0.w");
    &cmd("$curl $url/sat0w.w");
    &cmd("$curl $url/sat8.w");
    &cmd("$curl $url/sat9.w");
    &cmd("$curl $url/sat10.w");
    &cmd("$curl $url/sat11.w");
    &cmd("$curl $url/sat11k.ch");
    &cmd("$curl $url/sat12.w");
    &cmd("$curl $url/sat12-erp.w");
    &cmd("$curl $url/sat13.w");
    &cmd("$curl $url/sat-nfa.w");
    &cmd("$curl $url/sat-commafree.w");
    &cmd("$curl $url/SATexamples.tgz");
    &cmd("$curl $url/sat-life.tgz");
    &ch_dir("..");
}

sub sgb {
    my $dir = "sgb";
    &cmd("mkdir $dir");
    &cmd("rm -rf $dir/*");
    &ch_dir($dir);
    &cmd("tar xzf ../downloads/sgb.tar.gz");
    &cmd("make tests");
    my @names = grep(s/\.\w+$//, <*.{w,ch}>);
    &cweb(\@names, "../bin", "../pdf");
    &ch_dir("..");
}

sub sat {
    my $dir = "sat-solvers";
    &cmd("mkdir $dir");
    &cmd("rm -rf $dir/*");
    &ch_dir($dir);
    &cmd("cp -p ../downloads/*.w ../downloads/*.ch .");
    &cmd("ln -s ../sgb/*.c ../sgb/*.h ../sgb/libgb.a .");
    my @names = grep(s/\.\w+$//, <*.{w,ch}>);
    &cweb(\@names, "../bin", "../pdf");
    &ch_dir("..");
}

sub examples {
    my $dir = "sat-examples";
    &cmd("mkdir $dir");
    &cmd("rm -rf $dir/*");
    &ch_dir($dir);
    &cmd("tar xzf ../downloads/SATexamples.tgz");
    &ch_dir("sources");
    &cmd("ln -s ../../sgb/*.c ../../sgb/*.h ../../sgb/libgb.a .");
    my @names = grep(s/\.\w+$//, <*.{w,ch}>);
    &cmd("ln -s ../../sgb/gb_types.w .");
    &cweb(\@names, "../../bin", "../../pdf");
    &ch_dir("../..");
}

sub life {
    my $dir = "sat-life";
    &cmd("mkdir $dir");
    &cmd("rm -rf $dir/*");
    &ch_dir($dir);
    &cmd("tar xzf ../downloads/sat-life.tgz");
    &cmd("ln -s ../sgb/*.c ../sgb/*.h ../sgb/libgb.a .");
    my @names = grep(s/\.\w+$//, <*.{w,ch}>);
    &cweb(\@names, "../bin", "../pdf");
    &ch_dir("..");
}

sub cweb {
    my ($names, $bindir, $pdfdir) = @_;
    foreach my $name (@$names) {
        if (! -e "$name.c") {
            if (-e "$name.w") {
                &cmd("ctangle", "$name.w");
            } elsif (-e "$name.ch") {
                my $w = &w($name);
                &cmd("ctangle", $w, "$name.ch", "$name.c");
            } else {
                die $name;
            }
            &cmd("gcc -w -o $name $name.c libgb.a");
            &cmd("mv", $name, $bindir);
        }
        if (! -e "$pdfdir/$name.pdf") {
            if (-e "$name.w") {
                &cmd("cweave", "$name.w");
            } elsif (-e "$name.ch") {
                my $w = &w($name);
                &cmd("cweave", $w, "$name.ch", "$name.tex");
            } else {
                die;
            }
            &cmd("tex -interaction nonstopmode $name.tex");
            &cmd("dvipdfm $name.dvi");
            my @files = <$name.{tex,dvi,log,toc,idx,scn}>;
            &cmd("rm " . join(" ", @files));
            &cmd("mv", "$name.pdf", $pdfdir);
        }
    }
}

sub w {
    my ($ch) = @_;
    if ($change{$ch}) {
        return $change{$ch};
    }
    my @s = split(/\b/, $ch);
    while (@s) {
        my $w = join("", @s) . ".w";
        if (-e $w) {
            return $w;
        }
        pop(@s);
    }
    warn $ch;
}

sub ch_dir {
    my ($dir) = @_;
    if ($opt_n) {
        print "cd $dir\n";
    } else {
        print "# cd $dir\n";
        chdir $dir;
    }
}

sub cmd {
    my $cmd = join(" ", @_);
    if ($opt_n) {
        print "$cmd 2>&1\n";
    } else {
        print "# $cmd\n";
        system("$cmd 2>&1");
    }
}
