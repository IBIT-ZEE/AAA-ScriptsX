@wmic.exe useraccount where "name like '%%%1%%'" get caption,disabled,domain,passwordchangeable,passwordexpires /format:table
