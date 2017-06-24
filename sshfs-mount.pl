#!/usr/bin/perl
# Authored by: https://techalicious.club
# Date: March, 26th 2016

use strict;
use warnings;
$|++;

scalar @ARGV == 2
	? &sshfs(shift, shift)	
	: die qq~Need arguments. Example: ssh-mount <remote server> <local mount path>\n~;

sub sshfs
{
	my ($remote_server,$local_path) = @_;
	
	system qq~sshfs -o allow_other -o kernel_cache -o auto_cache -o reconnect -o compression=no -o cache_timeout=600 -o ServerAliveInterval=15 ${remote_server} ${local_path}~;
	  
	  die "Somthing went wrong: Error code ${?}\n" if $?;
 }