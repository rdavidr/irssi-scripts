use Irssi qw(command_bind signal_add print active_win server_find_tag ) ;
use strict;

sub msg_pub {
	my($server, $text, $nick, $mask,$chan) = @_;
	return if ($server->{tag} !~ /3dg|fnode|lia|gsg/);
	
	if ($text =~ /^!/) {
		my @line = split(" ",$text);
		$_ = $line[0];
		{
			/^!h[ea]lp$/ 	and do {
				my $cmds = Irssi::settings_get_str('halpcommands');
				sayit($server,$chan,$cmds);
				return;
			};
			/^!fortune$/	and do {
				my $fortune = `/usr/bin/fortune -s`;
				my @foo = split(/\n/, $fortune);
				sayit($server,$chan,"[fortune] $_") for (@foo);
				return; 
			};
			/^!say$/	and do {
				my $itsme = 0;
				$itsme = 1 if ($server->{tag} eq 'fnode' and $nick =~ /^sQuEE`?$/ and $mask =~ m{unaffiliated/sq/x-\d+}i);
				$itsme = 1 if ($server->{tag} eq '3dg' and $nick =~ /^sQuEE`?$/ and $mask =~ m{^~sq@}i);
				if ($itsme) {
					$text =~ s/^!say\s+//;
					sayit($server,$chan,$text);
					return;
				}
			};
			/^!do$/		and do {
				my $itsme = 0;
				$itsme = 1 if ($server->{tag} eq 'fnode' and $nick =~ /^sQuEE`?$/ and $mask =~ m{unaffiliated/sq/x-\d+}i);
				$itsme = 1 if ($server->{tag} eq '3dg' and $nick =~ /^sQuEE`?$/ and $mask =~ m{^~sq@}i);
				if ($itsme) {
					$text =~ s/^!do\s+//;
					doit($server,$chan,$text);
					return;
				}
			};
			/^!uptime$/	and do { 
				get_uptime($chan,$server); 
				return; 
			};
			
		}
	}
}

sub get_uptime {
	my ($chan,$server) = @_;
	my ($upD,$upH,$upM) = `uptime` =~ /up (?:(\d+) days?,)? +?(\d+):(\d+),/;
#	my $record = `cat ~/.uptime_record`;# chomp($record);
	$upD = 0 if (!$upD);
	my $day = "day"; $day .= "s" if ($upD > 1);
	my $hs = "h"; $hs .= "s" if ($upH > 1);
	my $min = "min"; $min .= "s" if ($upM > 1);
	my $msg = "$upD $day $upH $hs $upM $min";
	sayit($server,$chan,$msg);

}

sub msg_priv {
	my ($server, $text, $nick, $address) = @_;
	my $msg = "I only do private shows for certain people I know, you are not on that list. talk to sQuEE, he's mah pimp";
	sayit($server, $nick, $msg); 
	Irssi::signal_stop()
}
sub sayit { 
	my ($server, $target, $msg) = @_;
	$server->command("MSG $target $msg");
}
sub doit {
	my ($server, $target, $msg) = @_;
	$server->command("ACTION $target $msg");
}
sub print_msg { Irssi::print("@_"); }

signal_add("message private","msg_priv");
signal_add("message public","msg_pub");
Irssi::settings_add_str('misc-help', 'halpcommands', '');

