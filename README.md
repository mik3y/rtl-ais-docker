# RTL-AIS in Docker

This is a small project that builds a Docker container for running
[rtl-ais](https://github.com/dgiardini/rtl-ais) in Docker. The container runs
`rtl_ais` in TCP listening mode on port 10110.

You can use it to build your own AIS (marine traffic) ship monitor.

## Usage

Here's an example of how to run the container under Docker.

```
$ docker run --rm -i -t -p 10110:10110 --device=/dev/bus/usb mik3y/rtl-ais -p 0.5 -n
```

If successful, the container will start, walk the USB device tree, and start
printing AIS messages to the console. You can also connect with TCP to port
`10110` to receive a message stream.

The default command of the container is:

```
rtl_ais -T -k -h 0.0.0.0 -p 10110
```

Arguments to `docker run` that are after the container name will be appended to
this command (`-p 0.5 -n` in the example above).
