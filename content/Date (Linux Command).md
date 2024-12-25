### General
- Command displays the system date
- Can can find more options using `man date`


### Examples
- By itself the `date` command displays current datetime in this format
	- `Fri Jul 21 19:15:20 IST 2023`
- Can you get it to display date in format of your choosing 
	- Using `%%`; `%a`, `%A` etc.
- You can convert [[Unix Epoch]] seconds to date 
	- `date --date='@2147483647'`
- Change time zone
- Get the local time when it's next friday 9am EST in America/Los_Angeles
```
date --date='TZ="America/Los_Angeles" 09:00 next Fri'
```
- You can do muchmore
- Use `date -I` if you want date in `yyyy-MM-dd` format
- Print the day of the week: `date +%A` will print something like `Saturday`


### Get Epoch Time
[[Unix Epoch]]
```
date +%s
```

### Date in `yyyyMMdd` Format
```
date +%Y%m%d
```