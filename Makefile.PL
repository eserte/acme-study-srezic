# -*- cperl -*-
use 5.008;
use ExtUtils::MakeMaker;

my $eumm_recent_enough = $ExtUtils::MakeMaker::VERSION >= 6.54;

if (!$eumm_recent_enough) {
    *MY::dist_core = sub {
	<<'EOF';
dist :
	$(NOECHO) $(ECHO) "Sorry, use a newer EUMM!"

EOF
    };
}

WriteMakefile(NAME          => 'Acme::Study::SREZIC',
	      AUTHOR        => 'Slaven Rezic <srezic@cpan.org>',
	      VERSION       => '1.01',
	      LICENSE       => 'perl',
	      ($eumm_recent_enough
	       ? (META_MERGE => { resources => { repository => 'git://github.com/eserte/acme-study-srezic.git' },
				})
	       : ()
	      ),
	      PREREQ_PM => { 'XML::LibXML' => 0,
			     'GD'          => 0,
			     'Test::More'  => 0,
			   },
	     );
