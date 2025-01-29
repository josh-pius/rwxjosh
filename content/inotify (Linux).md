### General
https://man7.org/linux/man-pages/man7/inotify.7.html
- The inotify API provides a mechanism for monitoring filesystem events.  Inotify can be used to monitor individual files, or to monitor directories.  When a directory is monitored, inotify will return events for the directory itself, and for files inside the directory.
- Associated [[System Calls (Software)]]
	- [[inotify_init (System Call)]]
	- [[inotify_add_watch (System Call)]]
	- [[inotify_rm_watch (System Call)]]