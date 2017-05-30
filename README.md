# bro
Nothing too crazy here, and it's my first docker work. It's a bro setup, including extra file extract scripts from git://github.com/hosom/bro-file-extraction.

The docker image is available here https://hub.docker.com/r/nelsondev/bro/ . 

To use it:
```
docker pull nelsondev/bro
docker run -i -t -v /path/to/my/pcap:/pcaps:rw nelsondev/bro bro -C -r /pcaps/wiresharknado.pcap local
```

where the mount point is the full path to a directory containing the pcap you want analyzed, and the file under -r/pcaps/ is the pcap you want analyzed (which is under /path/to/my/pcap, locally).

After the run, the directory containing your pcap will contain everything bro found -- logs of all the various traffic, a sub-directory called extract_files that has all the files bro found in the pcap, like http, ftp, smb, etc.
