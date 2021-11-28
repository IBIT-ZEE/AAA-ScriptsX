@wmic process where (caption!='WMIC.exe' AND commandline like '%%%~1%%' ) get processid,name,caption,commandline,sessionid,status,threadcount,workingsetsize /format:value
