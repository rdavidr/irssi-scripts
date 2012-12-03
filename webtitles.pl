#webfetchtitle 
use Irssi qw(command_bind signal_add print active_win server_find_tag ) ;
use LWP::UserAgent;
use strict;
#use HTML::Entities;
use Data::Dumper;

sub msg_pub {
	my($server, $text, $nick, $mask,$chan) = @_;

	my ($urlmatch) = $text =~ m{(https?://[^ ]+)};
#	print_msg("$urlmatch") if ($urlmatch);
	return if ($text =~ /^!\w+/);
	return if ($urlmatch =~ /(imdb)|(wikipedia)|(twitter)|(facebook)|(fbcdn)|(youtu(?:\.be)|be\.com)/i);
	if ($urlmatch =~ /imgur/) {
		#1st case: http://i.imgur.com/XXXX.png
		if ($urlmatch =~ m{http://i\.imgur\.com/(\w{5})\.[pjgb]\w{2}$}) {
				$urlmatch = "http://imgur.com/$1" if ($1);
		}
	}
		
	do_fetch($text, $chan, $server, $urlmatch) if ($server->{tag} =~ /3dg|fnode|lia|gsg/ and $urlmatch) ;
}

sub do_fetch {
	my ($text, $chan, $server, $urlmatch) = @_;

	my $ua = new LWP::UserAgent;
	$ua->agent(Irssi::settings_get_str('myUserAgent'));
	$ua->protocols_allowed( [ 'http', 'https'] );
	$ua->max_redirect( 3 );
	$ua->timeout( 30 );
	my $response = $ua->head( $urlmatch ); #para ver q es 
	if ($response->is_success) {
		if ($response->content_is_html) {
			my $got = $ua->get( $urlmatch );
			#return if no desc available
			my $title = $got->title if ($got->title);
			return if ($title =~ /the simple image sharer/);
			#$title = HTML::Entities::decode($title) if ($title);
			sayit($server, $chan, "[link title] \x02${title}\x20") if ($title);
			if ($urlmatch =~ /imgur/) {
				#check si hay un link a reddit and make a short link, fuck API
				my ($shortRedditLink) = $got->decoded_content =~ m{"http://www\.reddit\.com/\w/\w+/comments/(\w+)/[^"]+"};
        $shortRedditLink = "http://redd.it/$shortRedditLink" if ($shortRedditLink);
				sayit($server,$chan,"[sauce] $shortRedditLink") if ($shortRedditLink);
			}
			return;
		}
	} 
}
sub print_msg { Irssi::active_win()->print("@_"); }
sub sayit {
  my ($server, $target, $msg) = @_;
  $server->command("MSG $target $msg");
}
signal_add("message public","msg_pub");
Irssi::settings_add_str('libwww', 'myUserAgent', '');
