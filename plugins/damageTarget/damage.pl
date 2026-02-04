package damageTarget;

#use strict;
use Plugins;
use Settings;
use Globals;
use Utils;
use Misc;
use Log qw(message error warning);
use Translation qw/T TF/;

use AI;
use Actor;
use Field;


Plugins::register("damage", "damage number on target", \&Unload, \&Reload);

#my $hook = Plugins::addHook("AI::Attack::main", \&onDamage);
my $hooks = Plugins::addHooks(
	['AI::Attack::main',   \&onDamage, undef],
	['Command_post', \&onCommand, undef],
);

sub Reload {
	message "damage plugin reloading, ", 'success';
	&Unload;
}

sub Unload {
	message "damage plugin unloading, ", 'success';
	#Plugins::delHook("AI::Attack::main", $hook);
	Plugins::delHooks($hooks);
}

sub onDamage {
	my $args = AI::args;
	my $ID = $args->{ID};
	
	my $target = Actor::get($ID) if (defined($ID));
	my $damage = $target->{dmgFromYou} if defined($target);
	#message "\$damage is $damage\n" if (defined($damage));
	#my %target = (
	#	dmgToYou => $target->{dmgToYou},
	#	missedYou => $target->{missedYou},
	#	dmgFromYou => $target->{dmgFromYou},
	#	missedFromYou => $target->{missedFromYou}
    #)  if defined($target);
    #Plugins::callHook('damage', \%target) if (defined(%target));
	Plugins::callHook('damage', {target => $damage}) if ($damage > 0);
}

sub onCommand {
	#my $args = AI::args;
	#my $ID = $args->{ID};
	#
	#my $target = Actor::get($ID) if (defined($ID));
	#my $damage = $target->{dmgFromYou} if defined($target);
	#message "\$damage is $damage\n" if (defined($damage));
	#my %target = (
	#	dmgToYou => $target->{dmgToYou},
	#	missedYou => $target->{missedYou},
	#	dmgFromYou => $target->{dmgFromYou},
	#	missedFromYou => $target->{missedFromYou}
    #)  if defined($target);
    #Plugins::callHook('damage', \%target) if (defined(%target));
	#Plugins::callHook('damage', {target => $damage}) if ($damage > 0);
	#message "\%params is", \%params
	#my ($self) = @_;
	#my $new_variables;
	#$new_variables->{".".$self->{name}."Last"} = $self->{last_hook};
	#message "\$self from hook is $self\n";
	#my %vars = $self->{vars};
	#my %variables = $self->{variables};
	#my $variables2 = $self->{variables};
	#message "\$self->{vars} from hook is ", %vars,"\n";
	#message "\$self->{variables} from hook is ", %variables,"\n";
	#message "\$self->{variables}2 from hook is $variables2\n";
	
	#while ( my( $key, $value ) = each %{$self->{vars}} ) {
		#if (ref($value) eq 'ARRAY') {
	#		$eventMacro->set_full_array(".".$self->{name}."Last".ucfirst($key), \@{$value});
	#	} elsif (ref($value) eq "HASH") {
	#		$eventMacro->set_full_hash(".".$self->{name}."Last".ucfirst($key), \%{$value});
	#	} else {
	#		$new_variables->{".".$self->{name}."Last".ucfirst($key)} = $value;
	#	}
	#	message "\$value from hook is $value\n";
	#}

	message "trigger onCommand\n";
}

1;