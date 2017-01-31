# Why do I want this?

For the ancient services that still insist on it (ahem, I'm looking at you, IRC), this image provides an RFC 1413 IDENT server based on Alpine Linux and using [dxtr/nullidentd](https://github.com/dxtr/nullidentd). And, because it's based on Alpine, it's small. *Really* small.

# Quick start

`docker run --name nullidentd -d -p 113:113/tcp gizmotronic/nullidentd`

# How do I build it?

At minimum, you must have Docker, curl, make, and unzip installed.

If you have these, you should be able to simply run this command:

`$ make`

This will pull a build image, download the nullidentd package, compile the executable, then extract and build it into the final Docker image.
