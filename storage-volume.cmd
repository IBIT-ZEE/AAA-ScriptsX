@wmic ^
        volume ^
                get Capacity, DriveType, FileSystem, Freespace, Label, Name ^
                /format:table

