if ($message =~ /^${sl}${cm}quiet $validChannel $validNick/) {
  authCheck($1,$hostname) ? actOut('MESSAGE','chanserv',"quiet $1 $2") : authError($sender,$target,$1);
}

if ($message =~ /^${sl}${cm}quiet $validNick/) {
  authCheck($target,$hostname) ? actOut('MESSAGE','chanserv',"quiet $target $1") : authError($sender,$target,$target);
}

if ($message =~ /^${sl}${cm}unquiet $validChannel $validNick$/) {
  authCheck($1,$hostname) ? actOut('MESSAGE','chanserv',"unquiet $1 $2") : authError($sender,$target,$1);
}

if ($message =~ /^${sl}${cm}unquiet $validNick/) {
  authCheck($target,$hostname) ? actOut('MESSAGE','chanserv',"unquiet $target $1") : authError($sender,$target,$target);
}