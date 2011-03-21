push (@commands_regexes, "$sl !ticket ([0-9]+)");
push (@commands_helps, "!ticket - Links to project's support tickets.");
push (@commands_subs, sub {
  $answer = $1; 
  $answer = "http://trac.unknown-horizons.org/t/ticket/$answer" if ($target =~ /#unknown-horizons/);
  $answer = "https://github.com/grickit/Gambot/issues#issue/$answer" if ($target =~ /##Gambot/);
  $answer = "https://gna.org/bugs/index.php?$answer" if ($target =~ /#wesnoth/);
  ACT("MESSAGE",$target,"$answer\n"); 

  my $request = LWP::UserAgent->new;
    $request->timeout(120);
    $request->env_proxy;
    $request->agent('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)');
  my $response = $request->get("$answer");
  my $content = $response->decoded_content;
  if ($content =~ /<title>((\n|\s|\r|\t|.)+)<\/title>/) { $answer="$1"; $answer=~s/(\n|\s|\r|\t)+/ /g; ACT("MESSAGE","$target","$answer"); }
});