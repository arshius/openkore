for x in $@
do
    if [ ! -d "$x" ]; then
        mkdir $x
    fi
	if [ ! -f "$x" ]; then
		cp config$x.txt $x/config.txt
		cp config$x.txt $x/config_.txt
	else 
		cp config${x%??}.txt $x/config.txt
		cp config${x%??}.txt $x/config_.txt
	fi
    cp mon_control.txt $x/mon_control.txt
    ln -s arrowcraft.txt $x/arrowcraft.txt
    ln -s avoid.txt $x/avoid.txt
    ln -s buyer_shop.txt $x/buyer_shop.txt
    ln -s chat_resp.txt $x/chat_resp.txt
    ln -s consolecolors.txt $x/consolecolors.txt
    ln -s eventMacros.txt $x/eventMacros.txt
    ln -s items_control.txt $x/items_control.txt
    ln -s overallAuth.txt $x/overallAuth.txt
    ln -s pickupitems.txt $x/pickupitems.txt
    ln -s poseidon.txt $x/poseidon.txt
    ln -s priority.txt $x/priority.txt
    ln -s responses.txt $x/responses.txt
    ln -s routeweights.txt $x/routeweights.txt
    ln -s shop.txt $x/shop.txt
    ln -s sys.txt $x/sys.txt
    ln -s timeouts.txt $x/timeouts.txt
done
