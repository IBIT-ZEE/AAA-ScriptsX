Call IBIT-Log %0 %*

echo TShark --color --print -i LAN1 -f "port 80" 
echo TShark --color --print -i LAN1 -f "DNS"
echo,
echo,

echo pktmon filter add -p 20
echo pktmon filter list
echo pktmon start -p 0 --file-name con --etw
echo pktmon format PktMon.etl -o x.txt
echo pktmon stop
echo pktmon remove

echo,
echo,


echo,
echo,
