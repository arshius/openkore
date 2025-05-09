#########################################################################
#  OpenKore - Packet Receiveing
#  This module contains functions for Receiveing packets to the server.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
########################################################################
# Korea (kRO) # by alisonrag
# The majority of private servers use eAthena, this is a clone of kRO
package Network::Receive::kRO::RagexeRE_2025_03_19;
use strict;
use base qw(Network::Receive::kRO::RagexeRE_2021_11_03);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	
	my %packets = (
		#'0B4C' => ['cash_shop_open_result', 'V2', [qw(cash_points kafra_points)]], #10
		#'0B6D' => ['cash_shop_open_result', 'V2', [qw(cash_points kafra_points)]], #10
		'0B6E' => ['cash_shop_open_result', 'V2', [qw(cash_points kafra_points)]], #10
	);
	
	foreach my $switch (keys %packets) {
		$self->{packet_list}{$switch} = $packets{$switch};
	}

	return $self;
}

1;
