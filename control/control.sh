for x in $@
do
    if [ ! -d "$x" ]; then
        mkdir $x
    fi
	if [ ! -f "$x" ]; then
		cp -f config$x.txt $x/config.txt
		cp -f config$x.txt $x/config_.txt
	else 
		cp -f config${x%??}.txt $x/config.txt
		cp -f config${x%??}.txt $x/config_.txt
	fi
    ln -f arrowcraft.txt $x/arrowcraft.txt
    ln -f avoid.txt $x/avoid.txt
    ln -f buyer_shop.txt $x/buyer_shop.txt
    ln -f chat_resp.txt $x/chat_resp.txt
    ln -f consolecolors.txt $x/consolecolors.txt
    ln -f eventMacros.txt $x/eventMacros.txt
    cp -f items_control.txt $x/items_control.txt
	cp -f mon_control.txt $x/mon_control.txt
    ln -f overallAuth.txt $x/overallAuth.txt
    ln -f pickupitems.txt $x/pickupitems.txt
    ln -f poseidon.txt $x/poseidon.txt
    ln -f priority.txt $x/priority.txt
    ln -f responses.txt $x/responses.txt
    ln -f routeweights.txt $x/routeweights.txt
    ln -f shop.txt $x/shop.txt
    ln -f sys.txt $x/sys.txt
    ln -f timeouts.txt $x/timeouts.txt
done
