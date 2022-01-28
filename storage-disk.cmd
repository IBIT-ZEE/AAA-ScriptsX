@wmic ^
        diskdrive ^
                get name,index,size,partitions,caption ^
                /format:table

