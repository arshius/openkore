package eventMacro::Condition::MaxHP;

use strict;

use base 'eventMacro::Conditiontypes::NumericConditionState';

use Globals qw( $char );

sub _hooks {
	['Network::Receive::map_changed','in_game','packet/stat_info','packet/hp_sp_changed'];
}

sub _get_val {
	$char->{hp_max};
}

sub validate_condition {
	my ( $self, $callback_type, $callback_name, $args ) = @_;
	
	if ($callback_type eq 'variable') {
		$self->update_validator_var($callback_name, $args);
	}
	return $self->SUPER::validate_condition(  $self->validator_check );
}

sub get_new_variable_list {
	my ($self) = @_;
	my $new_variables;
	
	$new_variables->{".".$self->{name}."Last"} = $char->{hp_max};
	
	return $new_variables;
}

1;
