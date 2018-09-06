# Why do I want this?

For the ancient services that still insist on it (ahem, I'm looking at you, IRC), this image provides an RFC 1413 IDENT server based on Alpine Linux and using [gizmotronic/nullidentd](https://github.com/gizmotronic/nullidentd). And, because it's based on Alpine, it's small. *Really* small.

# Quick start

`docker run --name nullidentd -d -p 113:113/tcp gizmotronic/nullidentd`

# Environment

By default the service returns a random 8-character string for each request. You may override this behavior using an environment variable.

## IDENT_USER

This variable will be used to return a fixed string of no more than 20 octets (characters) for each response.

Be aware that the protocol disallows ASCII NUL, LF, and CR characters. The string will be terminated at a NUL. Any LF and/or CR characters will be stripped out of the response.

# How do I build it?

Run this command:

`$ docker build -t nullidentd .`
